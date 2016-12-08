//
//  HighscoreViewController.swift
//  CityCycler
//
//  Created by Eric Lau on 12/7/16.
//  Copyright © 2016 Alejandro Puente. All rights reserved.
//

import Foundation
import UIKit

class HighscoreViewController: UIViewController {
    static let sharedInstance = HighscoreViewController()
    
    // MARK: Properties
    
    @IBOutlet weak var user1: UILabel!
    @IBOutlet weak var user2: UILabel!
    @IBOutlet weak var user3: UILabel!
    @IBOutlet weak var user4: UILabel!
    @IBOutlet weak var user5: UILabel!
    
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    @IBOutlet weak var score3: UILabel!
    @IBOutlet weak var score4: UILabel!
    @IBOutlet weak var score5: UILabel!
    
    @IBAction func backButton(_ sender: UIButton) {
        
    }
//    let user = UserDefaults.standard.string(forKey: "email")
//    
//    let score = GameViewController.sharedInstance.highScoreLabel.text
//    
//    let checkHighscore = !GameViewController.sharedInstance.isPlaying
    
    func storeHighScore (score: String) {
        let user = UserDefaults.standard.string(forKey: "email")
        
//        let score = GameViewController.sharedInstance.highScoreLabel.text!
        
        let checkHighscore = !GameViewController.sharedInstance.isPlaying
        
                score1.text = "0";
                score2.text = "0";
                score3.text = "0";
                score4.text = "0";
                score5.text = "0";
        
        if (checkHighscore) {
            if Int(score)! > Int(score1.text!)! {
                score1.text = score
                user1.text = user
            } else if Int(score)! > Int(score2.text!)! {
                score2.text = score
                user2.text = user
            } else if Int(score)! > Int(score3.text!)! {
                score3.text = score
                user3.text = user
            } else if Int(score)! > Int(score4.text!)! {
                score4.text = score
                user4.text = user
            } else if Int(score)! > Int(score5.text!)! {
                score5.text = score
                user5.text = user
            }
            
        }
    }
}
