//
//  ViewController.swift
//  pomodoro
//
//  Created by Conor O'Mahony on 15/02/2016.
//  Copyright © 2016 Conor O'Mahony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let pomodoro = Pomodoro()

    @IBAction func playPauseBtn(sender: UIButton) {
        if pomodoro.isRunning {
            pomodoro.pause()
            sender.setImage(UIImage(named: "Icon_play_normal@2x.png"), forState: .Normal)
        } else {
            pomodoro.start()
            sender.setImage(UIImage(named: "Icon_pause_normal@2x.png"), forState: .Normal)
        }
        
 
    }
    
    
    @IBAction func resetBtn(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var pomodoroTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pomodoroTimeLabel.text = String(pomodoro.seconds)
        
        pomodoro.onTimerFired = { [unowned self] (timerLabelText) in
            print(timerLabelText)
            self.pomodoroTimeLabel.text = timerLabelText
        }
    }
    
    func updatePomodoroTime() {
        if (pomodoro.seconds >= 0)
        {
            pomodoroTimeLabel.text = String(pomodoro.seconds--)
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

class Pomodoro: NSObject {
    
    var timer: NSTimer?
    var onTimerFired: ((timerLabelText: String)->Void)?
    var isRunning: Bool = false
    var seconds: Double = 1500.0
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updatePomodoroTime"), userInfo: nil, repeats: true)
        isRunning = true
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    func updatePomodoroTime() {
        if let onTimerFired = onTimerFired {
            let minAndSec = minutesAndSeconds()
            let string = "\(minAndSec.minutes):\(minAndSec.seconds)"
            onTimerFired(timerLabelText: string)
        }
    }
    
    func minutesAndSeconds() -> (minutes: Int, seconds: Int) {
        
    }
    
}