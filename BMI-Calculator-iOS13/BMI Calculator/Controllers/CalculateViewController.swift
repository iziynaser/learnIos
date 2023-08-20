//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //var bmiValue = "0.0"
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //print(String(format: "%.0f", sender.value))
        //print(Int(sender.value))
        let weight =  String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
   
    @IBAction func heighSliderChanged(_ sender: UISlider) {
        
        //print(String(format: "%.2f", sender.value))
        let height = String(format: "%.2f", sender.value)
        heightLabel.text  = "\(height)m"
    }
    
    @IBAction func calculatrePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height:height,weight:weight)
        
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f",bmi)
//        self.present(secondVC, animated: true,completion: nil)
        
        self.performSegue(withIdentifier: "gotoResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue =  calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }

    
}

