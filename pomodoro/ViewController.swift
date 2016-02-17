//
//  ViewController.swift
//  pomodoro
//
//  Created by Conor O'Mahony on 15/02/2016.
//  Copyright © 2016 Conor O'Mahony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: NSTimer?
    
    @IBAction func startButton(sender: AnyObject) {
    timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: Selector("updatePomodoroTime"), userInfo: nil, repeats: true)
   }

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var pomodoroTimeLabel: UILabel!
    
    var pomodoroTime: Double = 25000
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pomodoroTimeLabel.text = String(pomodoroTime)
        let time = timeElapsed(pomodoroTime)
        time.minutes
        time.seconds
    }
    
    func updatePomodoroTime() {
        if (pomodoroTime >= 0)
        {
            pomodoroTimeLabel.text = String(pomodoroTime--)
        }
    }
    
    func timeElapsed(interval: Double) -> (minutes: Int, seconds: Int) {
        let minutes = Int(floor(interval/60))
        let seconds: Int = Int(trunc(interval - Double(minutes * 60)))
          return(minutes: minutes, seconds: seconds)
    }

    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

