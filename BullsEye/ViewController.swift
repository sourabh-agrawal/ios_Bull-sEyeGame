//
//  ViewController.swift
//  BullsEye
//
//  Created by sourabh agrawal on 08/01/19.
//  Copyright © 2019 sourabh agrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentvalue: Int = 0
    var randomValue: Int = 0
    var score = 0
    var totalRounds = 0
    
//    creating the outlet to save the initial value of slider
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentvalue = Int(slider.value.rounded())
        resetGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResiable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResiable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResiable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResiable, for: .normal)
        
    }

    @IBAction func showAlert(){
        
        let difference = abs(currentvalue-randomValue)
        var point =  100 - difference
        
        score += point
        
        let title : String
        
        if difference == 0 {
            title = "Perfect"
            point  += 100
            score += 100
        }else if difference < 5 {
            title = "You almost had it!"
            if difference == 1{
                point += 50
                score += 50
            }
        }else if difference < 10 {
            title = "Pretty good"
        }else{
            title = "Not even close..."
        }
        
        print("The value of slider is \(currentvalue) \n The value of random is\(randomValue) \n The value of difference is \(difference) \n total score \(score)")
        
        let message = "You scored \(point) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "okay", style: .default, handler: {
        
            action in
            self.round()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func showKnock(){
        let alert = UIAlertController(title: "ohh", message: "who is there", preferredStyle: .alert)
        let action = UIAlertAction(title: "close", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of slider is \(slider.value)")
//        currentvalue = Int(slider.value)
        let roundedValue = Int(slider.value.rounded())
        currentvalue = roundedValue
        print("The rounded value is \(currentvalue)")
    }
    
   
    func round(){
        totalRounds += 1
        currentvalue = 50
        slider.value = Float(currentvalue)
        randomValue  = Int.random(in: 1...100)
        //        1 and 100 are inclusive in the range
        updateLabels()
    }
    func updateLabels(){
        targetLabel.text = String(randomValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(totalRounds)
    }
    @IBAction func resetGame(){
        score = 0
        totalRounds = 0
        round()
    }
}

