//
//  homePageUIView.swift
//  pplLiftTracker
//
//  Created by Brooks Townsend on 2/1/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit

class homePageUIView: UIView {
    
    //TODO: Need to make keyboard disappear after typing
    
    //MARK: Properties
    @IBOutlet weak var weightValue: UITextField!
    @IBOutlet weak var heightValue: UITextField!
    @IBOutlet weak var maleFemaleSelector: UISegmentedControl!
    @IBOutlet weak var activityTextbox: UITextField!
    @IBOutlet weak var activityStepper: UIStepper!
    @IBOutlet weak var userAge: UITextField!
    @IBOutlet weak var caloriesRequired: UITextField!
    
    @IBAction func calculateCalories(_ sender: Any) {
        let weight:Double? = Double(weightValue.text!)
        let height:Double? = Double(heightValue.text!)
        let age:Int? = Int(userAge.text!)
        if(weight != nil && height != nil && userAge != nil){
            actualCalorieCalculation(weight: weight!, height: height!, age: age!)
        } else{
            let nilAlertController = UIAlertController(title: "Hey AppCoda", message: "What do you want to do?", preferredStyle: .alert)

            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            nilAlertController.addAction(defaultAction)
            
            UIApplication.shared.keyWindow?.rootViewController?.present(nilAlertController, animated: true, completion: nil)
        }
    }
    
    func actualCalorieCalculation(weight: Double, height: Double, age: Int){
        if (maleFemaleSelector.selectedSegmentIndex == 0){
            var maleCalories = (10 * (weight / 2.2) + (6.25 * (height * 2.54)))
            maleCalories =  maleCalories - Double(5 * age)
            maleCalories += 5
            if (activityStepper.value == 1){
                maleCalories *= 1.2
            } else if (activityStepper.value == 2){
                maleCalories *= 1.375
            } else if (activityStepper.value == 3){
                maleCalories *= 1.55
            } else if (activityStepper.value == 4){
                maleCalories *= 1.725
            } else if (activityStepper.value == 5){
                maleCalories *= 1.9
            }
            let maleCaloriesFormatted:String = String(format: "%3.2f", maleCalories)
            caloriesRequired.text = (maleCaloriesFormatted)
        } else{
            let weight:Double? = Double(weightValue.text!)
            let height:Double? = Double(heightValue.text!)
            let age:Int? = Int(userAge.text!)
            var femaleCalories = (10 * (weight! / 2.2) + (6.25 * (height! * 2.54)))
            femaleCalories =  femaleCalories - Double(5 * age!)
            femaleCalories -= 161
            if (activityStepper.value == 1){
                femaleCalories *= 1.2
            } else if (activityStepper.value == 2){
                femaleCalories *= 1.375
            } else if (activityStepper.value == 3){
                femaleCalories *= 1.55
            } else if (activityStepper.value == 4){
                femaleCalories *= 1.725
            } else if (activityStepper.value == 5){
                femaleCalories *= 1.9
            }
            let femaleCaloriesFormatted:String = String(format: "%3.2f", femaleCalories)
            caloriesRequired.text = femaleCaloriesFormatted
        }
    }
    
    @IBAction func ageEntered(_ sender: Any) {
        
    }
    @IBAction func activityStepperChanged(_ sender: Any) {
        if (activityStepper.value == 1){
            activityTextbox.text = "Sedentary"
        } else if (activityStepper.value == 2){
            activityTextbox.text = "Light"
        } else if (activityStepper.value == 3){
            activityTextbox.text = "Moderate"
        } else if (activityStepper.value == 4){
            activityTextbox.text = "Highly"
        } else if (activityStepper.value == 5){
            activityTextbox.text = "Extremely"
        } else{
            activityTextbox.text = "No Modifier"
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
