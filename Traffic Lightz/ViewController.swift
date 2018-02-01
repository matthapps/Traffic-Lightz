//
//  ViewController.swift
//  Traffic Lightz
//
//  Created by Admin on 1/31/18.
//  Copyright © 2018 Matthew Heinrichs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trafficLightImage: UIImageView!
    @IBOutlet weak var startStopButton: UIButton!
    
    var startTimer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        
        if scoreInt == 0 {
            timerInt = 3
            trafficLightImage.image = UIImage(named: "trafficLight")
            
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            scoreLabel.text = String(scoreInt)
            startStopButton.isEnabled = false
            startStopButton.setTitle("", for: UIControlState.normal)
            
        } else {
            scoreTimer.invalidate()
            scoreInt = 0
            startStopButton.setTitle("Play Again", for: UIControlState.normal)
        }
        
    }
    
    @objc func updateTimer() {
        timerInt -= 1
        
        if timerInt == 2 {
            trafficLightImage.image = UIImage(named: "trafficLight3")
        } else if timerInt == 1 {
            trafficLightImage.image = UIImage(named: "trafficLight2")
        } else if timerInt == 0 {
            trafficLightImage.image = UIImage(named: "trafficLight1")
            
            startTimer.invalidate()
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            
            startStopButton.isEnabled = true
            startStopButton.setTitle("Stop", for: UIControlState.normal)
        }
    }
    
    @objc func updateScoreTimer() {
        scoreInt += 1
        scoreLabel.text = String(scoreInt)
    }

}

