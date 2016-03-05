//
//  Game.swift
//  2player-combat
//
//  Created by Brian on 3/5/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import Foundation
import AVFoundation

class Game{
    
    var soundFile: AVAudioPlayer!
    
    init(){
        
        self.setupSound()
        
    }
    
    
    private func setupSound(){
        
        self.sound("main-theme", action: "play")

    }
    
    
    private func sound(fileName: String, action: String){
        let soundPath = NSBundle.mainBundle().pathForResource(fileName, ofType: "mp3", inDirectory: "audio")
        let soundUrl = NSURL(fileURLWithPath: soundPath!)
        
        do {
            //play music from start
            try soundFile = AVAudioPlayer(contentsOfURL: soundUrl)
            
            if action == "play"{
                 soundFile.play()
            }else if action == "prepare"{
                soundFile.prepareToPlay()
            }
           
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
}