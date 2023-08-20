//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by IZIY on 3/4/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f",bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() ->String {
        return bmi?.advice ?? "no advice!"
    }
    
    func getColor() ->UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(height: Float,weight: Float){

        let bmiValue = weight / ( height * height )
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "underweight", color: UIColor.blue)
        } else if bmiValue < 24.5 {
            bmi = BMI(value: bmiValue, advice: "normal weight", color: UIColor.green)
        }else {
            bmi = BMI(value: bmiValue, advice: "over weight", color: UIColor.red)
        }
        
    }
}
