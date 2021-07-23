//
//  PomodoroViewController.swift
//  Github Practice
//
//  Created by Mariana Chavez on 7/22/21.
//

import UIKit

class PomodoroViewController: UIViewController {
    @IBOutlet weak var countdownLabel: UILabel!
    
    var time = 25
    
    var timer = Timer()
//    var timesToRepeat = 2
    
    @IBAction func startTimerTapped(_ sender: UIButton) {
//        countdownLabel.text = "hello"
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(PomodoroViewController.action), userInfo: nil, repeats: true)
    }
    @IBAction func pauseTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    @IBAction func resetTapped(_ sender: UIButton) {
        timer.invalidate()
        time = 25
        countdownLabel.text = String(time)
    }
    
    @objc func action() {
        if time > 0 {
            time -= 1
            countdownLabel.text = String(time)
        } else {
            timer.invalidate()
            time = 25
            countdownLabel.text = String(time)
        }
    }
    
    
    @IBOutlet weak var breakCountdownLabel: UILabel!
    
    var breakTime = 5
    var breakTimer = Timer()
    
    
    @IBAction func startBreakTapped(_ sender: UIButton) {
        breakTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(PomodoroViewController.breakAction), userInfo: nil, repeats: true)
    }
    @IBAction func pauseBreakTapped(_ sender: UIButton) {
        breakTimer.invalidate()
    }
    @IBAction func resetBreakTapped(_ sender: UIButton) {
        breakTimer.invalidate()
        breakTime = 5
        breakCountdownLabel.text = String(breakTime)
    }
    
    @objc func breakAction() {
        if breakTime > 0 {
            breakTime -= 1
            breakCountdownLabel.text = String(breakTime)
        } else {
            breakTimer.invalidate()
            breakTime = 5
            breakCountdownLabel.text = String(breakTime)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func setUpTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
//    }
//
//    func setUpBreakTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerBreakFires), userInfo: nil, repeats: true)
//    }
//
//    @objc func onTimerFires() {
//        if
//    }
//
//    @objc func onTimerBreakFires() {
//
//    }
    
    
}

/*class PomodoroViewController: UIViewController{
    var secondsRemaining = 30
    @IBAction func startTimer(_ sender: UIButton) {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(Timer) in
            if self.secondsRemaining > 0 {
                print ("\(self.secondsRemaining) seconds")
                self.secondsRemaining -= 1
                
            } else {
                Timer.invalidate()
            }
            
        }
    }


        override func viewDidLoad() {
            super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}*/
    
            
        
    
                

    /*let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
    @objc func fireTimer() {
        print("Timer fired!")
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


