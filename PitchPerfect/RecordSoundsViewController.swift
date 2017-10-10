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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
stopRecordingButton.isEnabled=false
        
    }
    
    
    
    
    @IBAction func recordaudio(_ sender: Any) {
        recordingLabel.text="Recording in Progress"
        recordButton.isEnabled=false
        stopRecordingButton.isEnabled=true
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
        recordingLabel.text="Tap to Record"
        stopRecordingButton.isEnabled=false
        recordButton.isEnabled=true
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
    
    
    
}

