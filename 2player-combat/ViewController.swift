//
//  ViewController.swift
//  2player-combat
//
//  Created by Brian on 3/5/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let game = Game()
    
    var player1Selecting = true
    var player2Selecting = false
    
    var player1Sprite = ""
    var player2Sprite = ""
    
    @IBOutlet weak var character1: UIImageView!
    @IBOutlet weak var character2: UIImageView!
    
    @IBOutlet weak var chooseHeroBtn: UIButton!
    @IBOutlet weak var chooseEnemyBtn: UIButton!

    @IBOutlet weak var mainLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1Screen()
        
    }
    
    @IBAction func chooseHeroClick(sender: AnyObject) {
        
        
        if player1Selecting == true{
            player1Sprite = "player-1"
            
            var player1 = Hero()
            
            player2Screen()
            
        }else if player2Selecting == true{
            player2Sprite = "player-2"
            
            var player2 = Hero()
            
            //start game after player 2
            startGame(player1Sprite, player2Character: player2Sprite)
        }
       
        
    }
    
    @IBAction func chooseEnemyClick(sender: AnyObject) {
        
        if player1Selecting == true{
            player1Sprite = "enemy-1"
            
            player2Screen()
            
            var player1 = Enemy()
        
        }else if player2Selecting == true{
            player2Sprite = "enemy-2"
            
            var player2 = Enemy()
            
            //start game after player 2
            startGame(player1Sprite, player2Character: player2Sprite)
        }
    }
    
    func player1Screen(){
        
        character1.image = UIImage(named: "player-1")
        character2.image = UIImage(named: "enemy-1")
        
    }
    
    func player2Screen(){
        
        player1Selecting = false
        player2Selecting = true
        
        mainLbl.text = "Player 2 Choose Character"
        character1.image = UIImage(named: "player-2")
        character2.image = UIImage(named: "enemy-2")
        
    }
    
    func startGame(player1Character: String, player2Character: String){
        
        //should initialize objects of 'characters' here instead of sprites, HP, attack etc..
        
        character1.image = UIImage(named: player1Character)
        character2.image = UIImage(named: player2Character)
        
        chooseHeroBtn.hidden = true
        chooseEnemyBtn.hidden = true
        
        //maybe change music?
        
        mainLbl.text = "FIGHT!"
    }
    
    

    
    
}

