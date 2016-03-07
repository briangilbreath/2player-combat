//
//  Hero.swift
//  2player-combat
//
//  Created by Brian on 3/5/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import Foundation

class Hero: Character{
    
    var attackSound: Sound!
    var deathSound: Sound!
    
    init(){
        super.init(startingHp: 125, attackPwr: 20)
        
        attackSound = Sound(fileName:"punch-1")
        attackSound.prepareToPlay()
        
        deathSound = Sound(fileName:"death-1")
        deathSound.prepareToPlay()
    }
    
    override func isAttackedBy(attackPwr:Int) -> Bool{
        super.isAttackedBy(attackPwr)
        
        if attackSound.playing{
            attackSound.stop()
            attackSound.prepareToPlay()
        }
        
        attackSound.play()
        
        return true

    }
    
    override func isKilled(){
        
        deathSound.play()
        
    }
    
    
}