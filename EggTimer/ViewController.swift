//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let softEggTime = 5 * 60
    let medEggTime = 8 * 60
    let hardEggTime = 12 * 60
    var testingTimer : Float = 0
    weak var timer: Timer?

    @IBOutlet weak var eggProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //init progress bar
        eggProgressView.progress = 0.0
    }
    
    @IBAction func eggSelected(_ sender: UIButton) {
        let eggTime = sender.tag
        switch eggTime {
        case 5:
            print("soft egg started")
            startTimer(level : 5)
        default:
            print("cannot start progress bar.")
        }
    }
    
    @objc func timerHandler(_ timer: Timer) {
        testingTimer += 1
        print("timer : \(testingTimer)")
        eggProgressView.setProgress(testingTimer/Float(softEggTime), animated: true)
        if testingTimer == Float(softEggTime) {
            timer.invalidate()
            testingTimer = 0
        }
    }
    
    func startTimer(level : Int) {
        timer?.invalidate()   // stops previous timer, if any

        let seconds = 1.0
        timer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(timerHandler(_:)), userInfo: nil, repeats: true)
    }
}
