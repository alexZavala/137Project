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
    
    @IBOutlet weak var user1: UILabel?
    @IBOutlet weak var user2: UILabel?
    @IBOutlet weak var user3: UILabel?
    @IBOutlet weak var user4: UILabel?
    @IBOutlet weak var user5: UILabel?
    
    @IBOutlet weak var score1: UILabel?
    @IBOutlet weak var score2: UILabel?
    @IBOutlet weak var score3: UILabel?
    @IBOutlet weak var score4: UILabel?
    @IBOutlet weak var score5: UILabel?
    
    @IBAction func backButton(_ sender: UIButton) {
        
    }
//    let user = UserDefaults.standard.string(forKey: "email")
//    
//    let score = GameViewController.sharedInstance.highScoreLabel.text
//    
//    let checkHighscore = !GameViewController.sharedInstance.isPlaying
    
    func initialRun () {
        
        score1?.text = "0";
        score2?.text = "0";
        score3?.text = "0";
        score4?.text = "0";
        score5?.text = "0";
    }
    
    func storeHighScore (score: String) {
        let user = UserDefaults.standard.string(forKey: "email")
        
//        let score = GameViewController.sharedInstance.highScoreLabel.text!
        
        let checkHighscore = !GameViewController.sharedInstance.isPlaying
        
        
        
        if (checkHighscore) {
            if let text1 = score1?.text, !text1.isEmpty, let text2 = score2?.text, !text2.isEmpty, let text3 = score3?.text, !text3.isEmpty, let text4 = score4?.text, !text4.isEmpty, let text5 = score5?.text, !text5.isEmpty {
                if Int(score)! > Int(text1)! {
                    score1?.text = "\(score)"
                    user1?.text = "\(user)"
                    print("score1 active")
                } else if Int(score)! > Int(text2)! {
                    score2?.text = score
                    user2?.text = user
                } else if Int(score)! > Int(text3)! {
                    score3?.text = score
                    user3?.text = user
                } else if Int(score)! > Int(text4)! {
                    score4?.text = score
                    user4?.text = user
                } else if Int(score)! > Int(text5)! {
                    score5?.text = score
                    user5?.text = user
                } else {
                    print("not used")
                }

            } else {
                print("why not")
            }
//            if Int(score)! > Int(score1?.text?)! {
//                score1?.text = score
//                user1?.text = user
//            } else
            
        }
    }
}
