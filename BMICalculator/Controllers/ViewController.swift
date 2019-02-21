//
//  ViewController.swift
//  BMICalculator
//
//  Created by 掛川優希 on 2/12/19.
//  Copyright © 2019 Yuki Kakegawa. All rights reserved.
//

import UIKit
import RealmSwift

protocol newDataDelegate {
    func newUserBMI(newBMI: String)
}

class ViewController: UIViewController {
    
//    var delegate: newDataDelegate?

    let realm = try! Realm()
    
    
    
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
        
        bmiResultLabel.numberOfLines = 1
        bmiResultLabel.adjustsFontSizeToFitWidth = true
        
        heightUnitLabel.numberOfLines = 1
        heightUnitLabel.adjustsFontSizeToFitWidth = true
        
        weightUnitLabel.numberOfLines = 1
        weightUnitLabel.adjustsFontSizeToFitWidth = true
        
        
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
            
            let stringBmi = String(format: "%.2f",bmi)
            BMILabel.text = stringBmi
            
            
            
            let newBmi = SharedData()
            newBmi.usersBMI = stringBmi
            saveData(data: newBmi)
            
            
            
//            let usersNewBMI = String(bmi)
//            delegate?.newUserBMI(newBMI: usersNewBMI)
            
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
            
            
//            let usersNewBMI = String(bmi)
//            delegate?.newUserBMI(newBMI: usersNewBMI)
            
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
        
        print("Calc button Pressed!")
        
        view.endEditing(true)
        
//        if let newData = selectedData {
//
//            let newDetails = Details()
//            newData.details.append(newDetails)
//            saveData(data: newData)
//
//        }
        
        if mySwitch.isOn {
//            print("KG result")
            bmiLbCalculator()
            
        } else {
//            print("LB result")
            bmiKgCalculation()
        }
        
    }
    
    func saveData(data: SharedData){
        do {
            try realm.write {
                realm.add(data)
                print(data)
            }}catch{
                print("Error...\(error)")
        }
    }
    
    
    
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        
        if mySwitch.isOn{
            print("Switch is on")
            heightUnitLabel.text = "ft"
            weightUnitLabel.text = "lb"
            
        } else {
            print("Switch is off")
            heightUnitLabel.text = "cm"
            weightUnitLabel.text = "kg"
            
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //let destinationVC = tabBarController?.navigationController?.visibleViewController
//        if segue.identifier == "goToHistory" {
//            let destinationVC = segue.destination as! UINavigationController
//            destinationVC.delegate = self as? UINavigationControllerDelegate
//        }
//    }
    
//    func saveData(data: Data){
//        
//        do {
//            try realm.write {
//                realm.add(data.details)
//                print("Saved the data!")
//            }}catch{
//                print("Error...\(error)")
//        }
//        
//    }
    
}
