//
//  ViewController.swift
//  Coag Calculator
//
//  Created by Macbook Pro on 8/3/18.
//  Copyright © 2018 grizzlybear. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    // variables
    var nacititube = 0.0
    
    @IBOutlet weak var txtfld1: UITextField!
    
    
    @IBOutlet weak var txtfld4: UITextField!
    
    
    @IBAction func mLtube30(_ sender: UIButton)
    {
        nacititube = 0.30
    }
    
    
    @IBAction func mLtube20(_ sender: UIButton)
    {
        nacititube = 0.20
    }
    
    
    @IBAction func ClearScreen(_ sender: UIButton)
    {
        txtfld1.text!.removeAll()
        txtfld4.text!.removeAll()
        txtfld3.text!.removeAll()
    }
    
    
    
    @IBOutlet weak var txtfld3: UITextField!
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtfld1.delegate = self
        txtfld4.delegate = self
        txtfld3.delegate = self
        
    
    }
    
    func textField(_ textfield: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let allowedCharacters = "1234567890."
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        txtfld1.resignFirstResponder()
        txtfld3.resignFirstResponder()
        txtfld4.resignFirstResponder()
        
        return true
    }

    @IBAction func calc(_ sender: Any)
    {
        
        // calculates the amount to remove from NaCitrate tube 
        
        let pthct = Double(txtfld1.text!)
        
        if pthct != nil
        {
          
        let result = Double((nacititube * (100.0 - pthct!)/55.0))
        let newresult = (100 * result).rounded() / 100
        let displayresult1 = (nacititube - newresult)
        let displayresult = (100 * displayresult1).rounded() / 100
            
        txtfld4.text! = "\(newresult)"
            
        txtfld3.text! = "\(displayresult)"
            
        }
        else
        {
            
        txtfld4.text! = "Invalid Result!!"
        txtfld3.text! = "Invalid Result!!"
            
        }

    
    }
    
    
}

