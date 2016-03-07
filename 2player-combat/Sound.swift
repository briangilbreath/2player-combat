//
//  Sound.swift
//  2player-combat
//
//  Created by Brian on 3/6/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import Foundation
import AVFoundation

class Sound{
    
    var soundFile: AVAudioPlayer!
    
    init(fileName: String){
        let soundPath = NSBundle.mainBundle().pathForResource(fileName, ofType: "mp3", inDirectory: "audio")
        let soundUrl = NSURL(fileURLWithPath: soundPath!)
        
        do {
   
            try soundFile = AVAudioPlayer(contentsOfURL: soundUrl)
        
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func play(){
        
        soundFile.play()
      
    }
    
    func prepareToPlay(){
        soundFile.prepareToPlay()
    }
    
    func stop(){
        soundFile.stop()
    }
    
    var playing: Bool{
        if soundFile.playing{
            return true
        }else{
            return false
        }
    }
    
}