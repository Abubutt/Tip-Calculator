//
//  SettingsViewController.swift
//  Prework
//
//  Created by Abu Butt on 8/8/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    @IBOutlet weak var tipLabel1: UILabel!
    
    @IBOutlet weak var tipLabel2: UILabel!
    
    @IBOutlet weak var tipLabel3: UILabel!
    
    @IBOutlet weak var tipText1: UITextField!
    
    @IBOutlet weak var tipText2: UITextField!
    
    @IBOutlet weak var tipText3: UITextField!
    
    @IBOutlet weak var darkModeState: UISwitch!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let tip1 = defaults.string(forKey: "tip1")
        let tip2 = defaults.string(forKey: "tip2")
        let tip3 = defaults.string(forKey: "tip3")
        
        if tip1 != nil{
            tipText1.text = tip1
        }
        if tip2 != nil{
            tipText2.text = tip2
        }
        if tip3 != nil{
            tipText3.text = tip3
        }
        
        let modeSwitch = UserDefaults.standard.bool(forKey: "switch")
        
        let textColor = UserDefaults.standard.string(forKey: "textColor")
        let viewColor = UserDefaults.standard.string(forKey: "viewColor")
        
        darkModeState.isOn = modeSwitch
        
        if textColor != nil{
            if textColor == "black"{
                let color = UIColor.black
                tipLabel1.textColor = color
                tipLabel2.textColor = color
                tipLabel3.textColor = color
                defaultTipLabel.textColor = color
                darkModeLabel.textColor = color
            }
            else{
                let color = UIColor.white
                tipLabel1.textColor = color
                tipLabel2.textColor = color
                tipLabel3.textColor = color
                defaultTipLabel.textColor = color
                darkModeLabel.textColor = color
            }
        }
        if viewColor != nil{
            if viewColor == "black"{
                view.backgroundColor = UIColor.black
            }
            else{
                view.backgroundColor = UIColor.white
            }
            
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        let tip1 = tipText1.text
        let tip2 = tipText2.text
        let tip3 = tipText3.text
        
        defaults.set(tip1, forKey: "tip1")
        defaults.set(tip2, forKey: "tip2")
        defaults.set(tip3, forKey: "tip3")
        
    }
    

    @IBAction func darkModePressed(_ sender: UISwitch) {
        let defaults = UserDefaults.standard
        if darkModeState.isOn{
            defaults.set(true, forKey: "switch")
            defaults.set("white", forKey: "textColor")
            defaults.set("black", forKey: "viewColor")
            let color = UIColor.white
            view.backgroundColor = UIColor.black
            tipLabel1.textColor = color
            tipLabel2.textColor = color
            tipLabel3.textColor = color
            defaultTipLabel.textColor = color
            darkModeLabel.textColor = color
        }
        else{
            defaults.set(false, forKey: "switch")
            defaults.set("black", forKey: "textColor")
            defaults.set("white", forKey: "viewColor")
            let color = UIColor.black
            view.backgroundColor = UIColor.white
            tipLabel1.textColor = color
            tipLabel2.textColor = color
            tipLabel3.textColor = color
            defaultTipLabel.textColor = color
            darkModeLabel.textColor = color
        }
    }
    

}
