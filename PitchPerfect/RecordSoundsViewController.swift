//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by  Felix Canaparro on 07/10/2017.
//  Copyright © 2017  Felix Canaparro. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    var audioRecorded: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopRecordingButton.isEnabled=false
        
    }
    
    func switchLabelAndButtons(isrecording: Bool){
        if  isrecording {
            recordingLabel.text="Recording in Progress"
            recordButton.isEnabled=false
            stopRecordingButton.isEnabled=true
        }
        else {
            recordingLabel.text="Tap to Record"
            stopRecordingButton.isEnabled=false
            recordButton.isEnabled=true
        }
        
    }
    
    @IBAction func recordaudio(_ sender: Any) {
         switchLabelAndButtons(isrecording: true)
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorded = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorded.delegate = self
        audioRecorded.isMeteringEnabled = true
        audioRecorded.prepareToRecord()
        audioRecorded.record()
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        switchLabelAndButtons(isrecording: false)
        audioRecorded.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
        print("Finished recording")
        performSegue(withIdentifier: "stopRecording", sender: audioRecorded.url)
        }
        else
        {
            print("Recoring was not sucessfull")
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"{
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioUrl = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioUrl
        }
    }
    
    
}

