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
    var running = false
    

    @IBAction func playPauseBtn(sender: AnyObject) {
        
        if running == false{
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("decreaseTimer"), userInfo: nil, repeats: true)
        running == true
        sender.setImage(UIImage(named: "Icon_play_normal@2x.png"), forState: .Normal)
        }
        else {
            timer?.invalidate()
            running == false
            sender.setImage(UIImage(named: "Icon_pause_normal@2x.png"), forState: .Selected)
        }
    }
    
    @IBAction func resetBtn(sender: AnyObject) {
        timer?.invalidate()
    }
    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var pomodoroTimeLabel: UILabel!
    
    var pomodoroTime =  1500 //timeElapsed(interval:1500.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pomodoroTimeLabel.text = String(pomodoroTime)
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

