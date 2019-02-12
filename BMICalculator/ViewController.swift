//
//  ViewController.swift
//  BMICalculator
//
//  Created by 掛川優希 on 2/12/19.
//  Copyright © 2019 Yuki Kakegawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bmi: Double = 0.0
    
    @IBOutlet weak var heightUnitLabel: UILabel!
    @IBOutlet weak var weightUnitLabel: UILabel!
    
    
    @IBOutlet weak var bmiResultLabel: UILabel!
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var BMILabel: UILabel!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiResultLabel.adjustsFontSizeToFitWidth = true
        bmiResultLabel.adjustsFontSizeToFitWidth = true
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    func bmiLbCalculator(){
        
        let height: String = heightTextField.text ?? "0"
        let weight: String = weightTextField.text ?? "0"
        
        if let heightInDouble: Double = Double(height), let weightInDouble: Double = Double(weight){
            
            bmi = 703 * (weightInDouble / (12 * (heightInDouble)) / (12 * (heightInDouble)))
            
            BMILabel.text = String(format: "%.2f",bmi)
            
            //bmi label changes
            if bmi < 18.5 {
                bmiResultLabel.text = "UnderWeight"
            } else if bmi < 24.9{
                bmiResultLabel.text = "Normal Weight"
            } else if bmi < 29.9 {
                bmiResultLabel.text = "Overweight"
            } else if bmi > 30 {
                bmiResultLabel.text = "Obesity"
            }
            
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a number", preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss", style: .default) { (action) in
                print("the user entered not a number...")
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func bmiKgCalculation(){
        
        //bmi calculation
        let height: String = heightTextField.text ?? "0"
        let weight: String = weightTextField.text ?? "0"
        
        if let heightInDouble: Double = Double(height), let weightInDouble: Double = Double(weight){
            
            bmi = weightInDouble / ((heightInDouble/100) * (heightInDouble/100))
            
            BMILabel.text = String(format: "%.2f",bmi)
            
            //bmi label changes
            if bmi < 18.5 {
                bmiResultLabel.text = "UnderWeight"
            } else if bmi < 24.9{
                bmiResultLabel.text = "Normal Weight"
            } else if bmi < 29.9 {
                bmiResultLabel.text = "Overweight"
            } else if bmi > 30 {
                bmiResultLabel.text = "Obesity"
            }
            
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a number", preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss", style: .default) { (action) in
                print("the user entered not a number...")
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    
    @IBAction func calcButton(_ sender: UIButton) {
        
        view.endEditing(true)
        
        if mySwitch.isOn {
//            print("KG result")
            bmiKgCalculation()
            
        } else {
//            print("LB result")
            bmiLbCalculator()
        }
        
    }
    
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        
        if mySwitch.isOn{
            
            heightUnitLabel.text = "cm"
            weightUnitLabel.text = "kg"
            
        } else {
            
            heightUnitLabel.text = "ft"
            weightUnitLabel.text = "lb"
            
        }
        
    }
    
    
}
