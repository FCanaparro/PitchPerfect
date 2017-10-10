//
//  ViewController.swift
//  PitchPerfect
//
//  Created by  Felix Canaparro on 07/10/2017.
//  Copyright © 2017  Felix Canaparro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordaudio(_ sender: Any) {
        print("record button was presses")
        recordingLabel.text="Recording in Progress"
        recordingLabel.isEnabled=false
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text="Tap to Record"
        
    }
}

