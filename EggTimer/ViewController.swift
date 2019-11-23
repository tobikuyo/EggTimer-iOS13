//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes = ["Soft" : 300,
                    "Medium" : 420,
                    "Hard" : 700]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle
        
        guard let hardnessU = hardness,
            let eggTimesU = eggTimes[hardnessU] else { return }
            totalTime = eggTimesU
        
        progressView.progress = 0.0
        secondsPassed = 0
        timeLabel.text = hardnessU
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            timeLabel.text = "Done!"
        }
    }
}
