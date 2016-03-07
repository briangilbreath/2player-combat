//
//  Game.swift
//  2player-combat
//
//  Created by Brian on 3/5/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import Foundation


class Game{
    
    var mainMusic: Sound?
    
    init(){
        
        self.playMainMusic()
        
    }
    
    
    func playMainMusic(){
        
        mainMusic = Sound(fileName:"main-theme")
        mainMusic?.play()

    }
    
    func playBattleMusic(){
        
        mainMusic = Sound(fileName:"battle-theme")
        mainMusic?.play()
        
    }
    
    func playVictoryMusic(){
        
        mainMusic = Sound(fileName:"victory-theme")
        mainMusic?.play()
        
    }
    

    
}