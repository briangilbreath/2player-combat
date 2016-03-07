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
    
    var player1: Character!
    var player2: Character!
    
    @IBOutlet weak var character1: UIImageView!
    @IBOutlet weak var character2: UIImageView!
    
    @IBOutlet weak var chooseHeroBtn: UIButton!
    @IBOutlet weak var chooseEnemyBtn: UIButton!
    
    @IBOutlet weak var player1AttackBtn: UIButton!
    @IBOutlet weak var player2AttackBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    

    @IBOutlet weak var mainLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1Screen()
        
    }
    
    @IBAction func chooseHeroClick(sender: AnyObject) {
        
        
        if player1Selecting == true{
            player1Sprite = "player-1"
            
            player1 = Hero()
            
            player2Screen()
            
        }else if player2Selecting == true{
            player2Sprite = "player-2"
            
            player2 = Hero()
            
            //start game after player 2
            startGame(player1Sprite, player2Character: player2Sprite)
        }
       
        
    }
    
    @IBAction func chooseEnemyClick(sender: AnyObject) {
        
        if player1Selecting == true{
            player1Sprite = "enemy-1"
            
            player2Screen()
            
            player1 = Enemy()
        
        }else if player2Selecting == true{
            player2Sprite = "enemy-2"
            
            player2 = Enemy()
            
            //start game after player 2
            startGame(player1Sprite, player2Character: player2Sprite)
        }
    }
    
    func player1Screen(){
        
        player1Selecting = true
        player2Selecting = false
        
        character1.hidden = false
        character2.hidden = false
        
        chooseEnemyBtn.hidden = false
        chooseHeroBtn.hidden = false
        
        mainLbl.text = "Player 1 choose character."
        
        character1.image = UIImage(named: "player-1")
        character2.image = UIImage(named: "enemy-1")
        
        game.playMainMusic()
        
    }
    
    func player2Screen(){
        
        player1Selecting = false
        player2Selecting = true
        
        mainLbl.text = "Player 2 Choose Character"
        character1.image = UIImage(named: "player-2")
        character2.image = UIImage(named: "enemy-2")
        
    }
    
    func startGame(player1Character: String, player2Character: String){
        
        
        character1.image = UIImage(named: player1Character)
        character2.image = UIImage(named: player2Character)
        
        player1AttackBtn.hidden = false
        player2AttackBtn.hidden = false
        

        chooseHeroBtn.hidden = true
        chooseEnemyBtn.hidden = true
        
        game.playBattleMusic()
        
        mainLbl.text = "FIGHT!"
    }
    
    
    @IBAction func player1AttackPressed(sender: AnyObject) {
        
        
        player2.isAttackedBy(player1.attackPwr)
        mainLbl.text = "Player 1 Attacked! \(player2.hp) HP"
        
        if !player2.isAlive{
            
            //if player2 is defeated

            mainLbl.text = "Player 2 Dead - Player 1 Wins!"
            character2.hidden = true
            player1AttackBtn.hidden = true
            player2AttackBtn.hidden = true
            restartBtn.hidden = false
            
            player2.isKilled()
        
            game.playVictoryMusic()
        }
        
        
    }
    
    @IBAction func player2AttackPressed(sender: AnyObject) {
       
        
        player1.isAttackedBy(player2.attackPwr)
        mainLbl.text = "Player 2 Attacked! \(player1.hp) HP"
        
        if !player1.isAlive{
            
            //if player1 is defeated
            
            mainLbl.text = "Player 1 Dead - Player 2 Wins"
            character1.hidden = true
            player1AttackBtn.hidden = true
            player2AttackBtn.hidden = true
            
            restartBtn.hidden = false
            
            player1.isKilled()
            
            game.playVictoryMusic()
        }
        
    }
    
   
    @IBAction func restartPressed(sender: AnyObject) {
        resetGameBoard()
    }
    
    
    func resetGameBoard(){
        
        character1.hidden = true
        character2.hidden = true
        player1AttackBtn.hidden = true
        player2AttackBtn.hidden = true
        
        restartBtn.hidden = true
        
        //go back to starting screen
        player1Screen()
    }

    
    
}

