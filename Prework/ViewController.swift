//
//  ViewController.swift
//  Prework
//
//  Created by Namita Mathew on 1/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eachLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tip Calculator"
        self.billAmountTextField.becomeFirstResponder()
        
        
       
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let bill = Double(billAmountTextField.text!) ?? 0
        
        var tipPercentages = String(self.tipControl.titleForSegment(at: self.tipControl.selectedSegmentIndex)!) 
        
        tipPercentages = tipPercentages.replacingOccurrences(of: "%", with: "")
        
        let tipPercent = Double(tipPercentages) ?? 0
        
       
        let tip = bill * (tipPercent/100)
        let total = bill + tip
        let pCount:Double = defaults.object(forKey:"pCount") as? Double ?? 0
        let each = total / pCount
        
        
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        tipAmountLabel.text = currencySymbol + String(format: "%.2f", tip)
        totalLabel.text = currencySymbol + String(format: "%.2f", total)
        eachLabel.text = currencySymbol + String(format: "%.2f", each)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tip1:String = defaults.object(forKey: "tip1") as? String ?? ""
        let tip2:String = defaults.object(forKey: "tip2") as? String ?? ""
        let tip3:String = defaults.object(forKey: "tip3") as? String ?? ""
        
        if (tip1 != ""){
            self.tipControl.setTitle(tip1, forSegmentAt: 0)
        }
        
        if (tip2 != ""){
            self.tipControl.setTitle(tip2, forSegmentAt: 1)
        }
        
        if (tip3 != ""){
            self.tipControl.setTitle(tip3, forSegmentAt: 2)
        }
        calculateTip(animated as AnyObject)
        
    }
   
}

