//
//  ViewController.swift
//  Prework
//
//  Created by Abu Butt on 8/6/22.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var billAmountLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmount: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpView()
    }
    
    func setUpView(){
        let defaults = UserDefaults.standard
        
        let tip1 = defaults.string(forKey: "tip1")
        let tip2 = defaults.string(forKey: "tip2")
        let tip3 = defaults.string(forKey: "tip3")
        
        if tip1 != nil{
            let percentage = tip1! + "%"
            tipControl.setTitle(percentage, forSegmentAt: 0)
        }
        if tip2 != nil{
            let percentage = tip2! + "%"
            tipControl.setTitle(percentage, forSegmentAt: 1)
            
        }
        if tip3 != nil{
            let percentage = tip3! + "%"
            tipControl.setTitle(percentage, forSegmentAt: 2)
            
        }
        
        let viewColor = defaults.string(forKey: "viewColor")
        
        let textColor = UserDefaults.standard.string(forKey: "textColor")
        
        if viewColor != nil{
            if viewColor == "black"{
                view.backgroundColor = UIColor.black
            }
            else{
                view.backgroundColor = UIColor.white
            }
        }
        
        if textColor != nil{
            if textColor == "black"{
                let color = UIColor.black
                tipAmount.textColor = color
                totalAmount.textColor = color
                billAmountLabel.textColor = color
                tipLabel.textColor = color
                totalLabel.textColor = color
                titleLabel.textColor = color
                tipControl.backgroundColor = UIColor.white
            }
            else{
                let color = UIColor.white
                tipAmount.textColor = color
                totalAmount.textColor = color
                billAmountLabel.textColor = color
                tipLabel.textColor = color
                totalLabel.textColor = color
                titleLabel.textColor = color
                tipControl.backgroundColor = UIColor.white
               
            }
        }
    }


    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip amount label
        tipAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
    
    
    }
    
}

