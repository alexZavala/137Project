//
//  RegisterViewController.swift
//  CityCycler
//
//  Created by AlexZavala on 12/5/16.
//  Copyright © 2016 Alejandro Puente. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userRepeatPassword: UITextField!
    @IBAction func registerButton(_ sender: Any) {
        
        self.userEmail.resignFirstResponder()
        self.userPassword.resignFirstResponder()
        self.userRepeatPassword.resignFirstResponder()
        
        let email = userEmail.text
        let password = userPassword.text
        let repeatPassword = userRepeatPassword.text
        
        //check for empty fields
        if((email?.isEmpty)! || (password?.isEmpty)! || (repeatPassword?.isEmpty)!){
            displayMyaAlertMessage(userMessage: "All fields are required") //display alert message
            return;
        }
        
        //chack if passwords match
        if(password != repeatPassword){
            displayMyaAlertMessage(userMessage: "Passwords do not match") //Display an alert message
            return
        }
        
        //Store data
        UserDefaults.standard.set(email, forKey:"email")
        UserDefaults.standard.set(password, forKey:"password")
        UserDefaults.standard.synchronize()
        
        //Display alert message with confirmation.
        let myAlert = UIAlertController(title: "Great!", message: "Registration is sucessful, Thank you!", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
            action in
            self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func back2Login(_ sender: Any) {
        UserDefaults.standard.set(false, forKey:"isUserLogin")
        UserDefaults.standard.synchronize()

        
    }
    
    func viewDidAppera(animated: Bool){
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLogin")
        if(!isUserLoggedIn){
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }
    
    
    func displayMyaAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Error", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
