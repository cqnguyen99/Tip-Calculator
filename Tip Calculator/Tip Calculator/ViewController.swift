//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Nguyen Quynh Chi on 12/24/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eachPerson: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partySizeControl: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        partySizeLabel.text=String(Int(sender.value))
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let people = partySizeControl.value
        
        //Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let each = total / Double(people)
        
        //Update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        eachPerson.text = String(format: "$%.2f", each)
    }
}

