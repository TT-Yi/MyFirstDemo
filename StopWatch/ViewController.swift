//
//  ViewController.swift
//  StopWatch
//
//  Created by 王佳亮 on 16/5/10.
//  Copyright © 2016年 BoYaWuZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var palyBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var Counter = 0.0
    var Timer = NSTimer()
    var IsPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(Counter)
        super.viewDidLoad();
    }
    @IBAction func palyButtonDidTouch(sender: AnyObject) {
        if (IsPlaying) {
            return
        }
        palyBtn.enabled = false
        pauseBtn.enabled = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTimer"), userInfo: nil, repeats: true)
        IsPlaying = true
        
    }
    func UpdateTimer (){
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f",Counter);
        
    
    }
    @IBAction func resetButtonDidTouch(sender: AnyObject) {
        Timer.invalidate();
        IsPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
        palyBtn.enabled = true;
        pauseBtn.enabled  = true;
    }
 
    
    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        palyBtn.enabled = true
        pauseBtn.enabled = false
        Timer .invalidate()
        IsPlaying = false
        
    }
 

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

