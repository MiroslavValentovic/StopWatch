//
//  ViewController.swift
//  StopWatch
//
//  Created by Miroslav Valentovic on 09/01/2021.
//

import UIKit
import SwiftUI
import AVFoundation

class ViewController: UIViewController {
    
    var (hours, minutes, seconds, fractions) = (0, 0, 0, 0)
    var timer = Timer()
    
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var fractionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Buttons
        startButton.layer.cornerRadius = 75
        startButton.layer.masksToBounds = true
        
        stopButton.layer.cornerRadius = 75
        stopButton.layer.masksToBounds = true
        
        resetButton.layer.cornerRadius = 75
        resetButton.layer.masksToBounds = true
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(keepTimer), userInfo: nil, repeats: true)
        startButton.isHidden = true
        
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        timer.invalidate()
        startButton.isHidden = false

    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        timer.invalidate()
        (hours, minutes, seconds, fractions) = (0, 0, 0, 0)
        counterLabel.text = "00:00:00."
        fractionsLabel.text = "00"
        startButton.isHidden = false


    }
    
    @objc func keepTimer() {
        
        fractions += 1
        if fractions > 99 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        if minutes == 60 {
            hours += 1
            minutes = 0
        }
        
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"

        counterLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
        fractionsLabel.text = ".\(fractions)"
    }
    
    
}

