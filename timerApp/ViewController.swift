//
//  ViewController.swift
//  timerApp
//
//  Created by Kunlaya Kobunnoi on 2018-02-22.
//  Copyright © 2018 BCIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    var resumeTapped = false
    
    @IBAction func startButton(_ sender: Any) {
        if isTimerRunning == false {
            runTimer()
            self.button.isEnabled = false
        }
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        //1. The interval is measured seconds so for it to perform like a standard clock we should set this argument to 1. timeInterval: 1
        //2. updateTimer is the name of the method that will be called at each second. This method will update the label. We will define this method below in the next step.
        isTimerRunning = true
        button1.isEnabled = true
    }
    @IBAction func pauseButton(_ sender: Any) {
        if self.resumeTapped == false {
            timer.invalidate()
            isTimerRunning = false
            self.resumeTapped = true
            self.button1.setTitle("Resume",for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
            self.button1.setTitle("Pause",for: .normal)
        }
    }
    @IBAction func resetButton(_ sender: Any) {
        timer.invalidate()
        seconds = 60
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
        button1.isEnabled = false
        button.isEnabled = true
    }
    //This method call initializes the timer. It specifies the timeInterval (how often the a method will be called) and the selector (the method being called).
    
   
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate time's up.
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
            timerLabel.text = String(seconds)
            
        }
    }
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButton()
        makeButton1()
        makeButton2()
    }

    func makeButton() {
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 25.0
    }
    
    func makeButton1() {
        button1.layer.cornerRadius = 0.5 * button.bounds.size.width
        button1.clipsToBounds = true
        button1.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button1.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button1.layer.shadowOpacity = 1.0
        button1.layer.shadowRadius = 0.0
        button1.layer.masksToBounds = false
        button1.layer.cornerRadius = 25.0
    }
    
    func makeButton2() {
        button2.layer.cornerRadius = 0.5 * button.bounds.size.width
        button2.clipsToBounds = true
        button2.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button2.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button2.layer.shadowOpacity = 1.0
        button2.layer.shadowRadius = 0.0
        button2.layer.masksToBounds = false
        button2.layer.cornerRadius = 25.0
    }


}

