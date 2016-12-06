//
//  LoginViewController.swift
//  CityCycler
//
//  Created by AlexZavala on 12/5/16.
//  Copyright © 2016 Alejandro Puente. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var credentialsLabel: UILabel!

    @IBOutlet weak var passwordCredentials: UILabel!
    
    @IBAction func LoginButton(_ sender: UIButton) {
        
        let usr = "cmpe137Student"
        let password = "student"
        
        if Username.text == usr && Password.text != password{
            credentialsLabel.text = ""
            passwordCredentials.text = "Password is incorrect, Please Re-enter"
            passwordCredentials.textColor = UIColor.red
            Username.resignFirstResponder()
            Password.resignFirstResponder()
        }
        else if Username.text == usr && Password.text == password{
            credentialsLabel.textColor = UIColor.green
            passwordCredentials.textColor = UIColor.green
            credentialsLabel.text = "✓"
            passwordCredentials.text = "✓"
            Username.resignFirstResponder()
            Password.resignFirstResponder()
        }
        
        else if Username.text != usr && Password.text == password{
            credentialsLabel.text = "Username incorrect"
            passwordCredentials.text = ""
            credentialsLabel.textColor = UIColor.red
            Username.resignFirstResponder()
            Password.resignFirstResponder()
        }
            
     
        else{
            credentialsLabel.text = "Credentials are incorrect"
            passwordCredentials.text = "Credentials are incorrect"
            credentialsLabel.textColor = UIColor.red
            passwordCredentials.textColor = UIColor.red
            Username.resignFirstResponder()
            Password.resignFirstResponder()
        }
    }

    override func viewDidLoad() {
        
        //LoginButton(UIButton)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : MenuViewController = segue.destination as! MenuViewController
            DestViewController.nameLabelText = Username.text!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
