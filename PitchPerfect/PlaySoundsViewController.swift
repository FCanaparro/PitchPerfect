//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by  Felix Canaparro on 10/10/2017.
//  Copyright © 2017  Felix Canaparro. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton : UIButton!
    @IBOutlet weak var chipmunkButton : UIButton!
    @IBOutlet weak var rabbitButton : UIButton!
    @IBOutlet weak var vaderButton : UIButton!
    @IBOutlet weak var echoButton : UIButton!
    @IBOutlet weak var reverbButton : UIButton!
    @IBOutlet weak var stopButton : UIButton!
    
    var recorderdAudioUrl : URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayer!
    var stopTimer: Timer!
    
    enum Buttontype: Int { case slow=0, fast, chipmunk, vader,echo, reverb }
    
    
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        print ( "Play sound button pressed")
    }
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        print ("Stop button was pressed")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        

        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

 
}
