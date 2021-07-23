//
//  LongIntervalsViewController.swift
//  Github Practice
//
//  Created by Mariana Chavez on 7/22/21.
//

import UIKit

class LongIntervalsViewController: UIViewController {

    @IBOutlet weak var countDownLabel: UILabel!
    var time = 50
    
    //timer
    var timer = Timer()
    
    
    @IBAction func startTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(LongIntervalsViewController.action), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        timer.invalidate()
        time = 50
        countDownLabel.text = String(time)
    }
    
    @objc func action() {
        if time > 0 {
            time -= 1
            countDownLabel.text = String(time)
        } else {
            timer.invalidate()
            time = 50
            countDownLabel.text = String(time)
        }
    }
    
    @IBOutlet weak var breakCountDownLabel: UILabel!
    var breakTime = 10
    var breakTimer = Timer()
    
    @IBAction func startBreakTapped(_ sender: UIButton) {
        breakTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(LongIntervalsViewController.breakAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseBreakTapped(_ sender: UIButton) {
        breakTimer.invalidate()
    }
    
    @IBAction func resetBreakTapped(_ sender: UIButton) {
        breakTimer.invalidate()
        breakTime = 10
        breakCountDownLabel.text = String(breakTime)
    }
    
    @objc func breakAction() {
        if breakTime > 0 {
            breakTime -= 1
            breakCountDownLabel.text = String(breakTime)
        } else {
            breakTimer.invalidate()
            breakTime = 10
            breakCountDownLabel.text = String(breakTime)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
