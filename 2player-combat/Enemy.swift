//
//  Enemy.swift
//  2player-combat
//
//  Created by Brian on 3/5/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import Foundation

class Enemy: Character{
    
    var attackSound: Sound!
    var deathSound: Sound!
    
    init(){
        super.init(startingHp: 100, attackPwr: 25)
        
        attackSound = Sound(fileName:"punch-2")
        attackSound.prepareToPlay()
        
        deathSound = Sound(fileName:"death-2")
        deathSound.prepareToPlay()
    }
    
    override func isAttackedBy(attackPwr:Int) -> Bool{
        super.isAttackedBy(attackPwr)
        
        if attackSound.playing{
            attackSound.stop()
        }
        
        attackSound.play()
        
        return true
        
    }
    
    override func isKilled(){
        
        deathSound.play()
        
    }
    
}