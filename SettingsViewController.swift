//
//  SettingsViewController.swift
//  Prework
//
//  Created by Namita Mathew on 1/27/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var tip1TextField: UITextField!
    
    
    @IBOutlet weak var tip2TextField: UITextField!
    
    @IBOutlet weak var tip3TextField: UITextField!
    
   
    @IBOutlet weak var peopleCountTextField: UITextField!
    
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        peopleCountTextField.text = Int(sender.value).description
    }
    
    
   let vc = ViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        peopleStepper.wraps = true
        peopleStepper.autorepeat = true
        peopleStepper.minimumValue = 0
        peopleStepper.maximumValue = 100
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
   
  
    
    @IBAction func tip1Changed(_ sender: Any){
        self.tip1TextField.backgroundColor = UIColor.black
        let defaults = UserDefaults.standard
        var tip1Text:String = tip1TextField.text!
        tip1Text = tip1Text.replacingOccurrences(of: "%", with: "")
        if (tip1Text == ""){
            tip1Text = "15"
        }
        defaults.set(tip1Text + "%", forKey: "tip1")
        defaults.synchronize()
        self.tip1TextField.backgroundColor = UIColor.lightGray
        self.tip1TextField.textColor = UIColor.black
        
    }
    
    @IBAction func tip2Changed(_ sender: Any){
        self.tip2TextField.backgroundColor = UIColor.black
        let defaults = UserDefaults.standard
        var tip2Text:String = tip2TextField.text!
        tip2Text = tip2Text.replacingOccurrences(of: "%", with: "")
        if (tip2Text == ""){
            tip2Text = "18"
        }
        defaults.set(tip2Text + "%", forKey: "tip2")
        defaults.synchronize()
        self.tip2TextField.backgroundColor = UIColor.lightGray
        self.tip2TextField.textColor = UIColor.black
        
    }
    
    @IBAction func tip3Changed(_ sender: Any){
        self.tip3TextField.backgroundColor = UIColor.black
        let defaults = UserDefaults.standard
        var tip3Text:String = tip3TextField.text!
        tip3Text = tip3Text.replacingOccurrences(of: "%", with: "")
        if (tip3Text == ""){
            tip3Text = "20"
        }
        defaults.set(tip3Text + "%", forKey: "tip3")
        defaults.synchronize()
        self.tip3TextField.backgroundColor = UIColor.lightGray
        self.tip3TextField.textColor = UIColor.black
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tip1:String =  defaults.object(forKey: "tip1") as? String ?? ""
        let tip2:String =  defaults.object(forKey: "tip2") as? String ?? ""
        let tip3:String =  defaults.object(forKey: "tip3") as? String ?? ""
        let pCount:Double = defaults.object(forKey: "pCount") as? Double ?? 1.0
        
        if (tip1 != ""){
            self.tip1TextField.text = tip1
        }
        if (tip2 != ""){
            self.tip2TextField.text = tip2
        }
        if (tip3 != ""){
            self.tip3TextField.text = tip3
        }
        
        self.peopleStepper.value = pCount
        self.peopleCountTextField.text = String(Int(pCount))
        
        
        self.tip1TextField.backgroundColor = UIColor.lightGray
        self.tip2TextField.backgroundColor = UIColor.lightGray
        self.tip3TextField.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func onScreenTouch(_ sender: Any){
        view.endEditing(true)
        viewWillAppear(true)
        stepperChanged(peopleStepper)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults =  UserDefaults.standard
        defaults.set((Double(self.peopleCountTextField.text!)), forKey:"pCount")
        
    }
    
    
   

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
