//
//  ViewController.swift
//  Egg Timer
//
//  Created by Utkarsh Pandey on 1/5/17.
//  Copyright © 2017 Utkarsh Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet weak var countField: UILabel!
    
    @IBAction func pressedPause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func pressePlay(_ sender: Any) {
        if let val = countField.text{
            if let count = Int(val){
                
                if (!timer.isValid && count > 0) {
                    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.recordTimer), userInfo: nil, repeats: true)
                }
            }
        }
    }
    
    @IBAction func pressedMinus(_ sender: Any) {
        if let val = countField.text{
            if var count = Int(val){
                if (count <= 10){
                    count = 0
                }else{
                    count -= 10
                }
                countField.text = String(count)
            }
        }

    }
    
    @IBAction func pressedPlus(_ sender: Any) {
        if let val = countField.text{
            if var count = Int(val){
                count += 10
                countField.text = String(count)
            }
        }
    }
    
    @IBAction func pressedReset(_ sender: Any) {
         countField.text = "210"
    }
    
    func recordTimer(){
        if let val = countField.text {
            if let count = Int(val){
                let newtime = count - 1
                if newtime <= 0{
                    timer.invalidate()
                }
                countField.text = String(newtime)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

