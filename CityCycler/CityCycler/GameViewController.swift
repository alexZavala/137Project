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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    func gameInit(){
        player = UIImageView(image: UIImage(named: "bike"))
        player.frame = CGRect(x:0, y:0, width:60, height:91)
        player.frame.origin.y = self.view.bounds.height - player.frame.size.height - 10
        player.center.x = self.view.bounds.midX
        
        self.view.insertSubview(player, aboveSubview: road)
        
    }

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
