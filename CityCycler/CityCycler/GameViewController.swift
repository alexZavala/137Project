//
//  GameViewController.swift
//  CityCycler
//
//  Created by Alejandro Puente on 11/18/16.
//  Copyright © 2016 Alejandro Puente. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var road: RoadView!
    
    var player: UIImageView!
    var enemy: EnemyCarView!
    
    var bikeMovementGestureRecognizer: UIGestureRecognizer!
    
    var animationTimer:Timer!
    
    let leftBoarder = 90
    let rightBoarder = 180
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        road.addDriveAnimation()
        gameInit()
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                if player.frame.origin.x < CGFloat(rightBoarder){
                    player.frame.origin.x += 90
                }
                break
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                if player.frame.origin.x > CGFloat(leftBoarder){
                    player.frame.origin.x -= 90
                }
                break
            default:
                break
            }
        }
    }
    
    func gameInit(){
        
        //Adding the player
        player = UIImageView(image: UIImage(named: "bike"))
        player.frame = CGRect(x:0, y:0, width:60, height:80)
        player.frame.origin.y = self.view.bounds.height - player.frame.size.height - 10
        player.center.x = self.view.bounds.midX
        
        
        self.view.insertSubview(player, aboveSubview: road)
        
        //GESTURE NOT WORKING YET
        
//        bikeMovementGestureRecognizer = UIGestureRecognizer(target: self, action: Selector(("playerPressed:")))
//        bikeMovementGestureRecognizer.minimumPressDuration = 0.001
//        road.addGestureRecognizer(bikeMovementGestureRecognizer)
        
        //Adding the enemey function
        addEnemy()
        
    }
    
    
    func addEnemy(){
        var randomEnemyFrame = CGRect(x: 0, y:  -player.frame.size.height,width:  player.frame.size.width,height:  player.frame.size.height)
        let randomX = leftBoarder - 20 + (Int(arc4random_uniform(3)) * (rightBoarder - leftBoarder)) // generates enemy to be 1 of 3 possible locations
        randomEnemyFrame.origin.x = CGFloat(randomX)
        enemy = EnemyCarView(frame: randomEnemyFrame)
        //enemy.addPoluteAnimation() //adds pollution to the animation
        self.view.insertSubview(enemy, aboveSubview: road)
        
        
        //Change duration to make the cars go faster. The lower the number the faster the car goes.
        //Change the delay to make the cars wait to be displayed on screen.
        UIView.animate(withDuration: 3, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
        self.enemy.frame.origin.y = self.view.bounds.height + self.enemy.frame.height
        }) { (success:Bool) -> Void in
            self.enemy.removeFromSuperview()
            self.addEnemy()
        }
    }
    
    //NOT WORKING
    
//    func playerPressed(recognizer: UILongPressGestureRecognizer){
//        if recognizer.state == UIGestureRecognizerState.ended{
//            if animationTimer != nil{
//                animationTimer.invalidate()
//            }
//        }
//        else if recognizer.state == UIGestureRecognizerState.began{
//            let touchPoint = recognizer.location(in: road)
//            
//            if touchPoint.x > road.frame.midX{
//                animationTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.005), target: self, selector: Selector(("moveBike:")), userInfo: "right", repeats: true)
//            }
//            else{
//                animationTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.005), target: self, selector:Selector(("moveBike:")), userInfo: "left", repeats: true)
//            }
//        }
//    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}





