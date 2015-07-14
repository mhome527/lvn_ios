//
//  MyAudioPlayer.swift
//  lvn
//
//  Created by admin on 6/17/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayerManager: NSObject, AVAudioPlayerDelegate {
   
    let TAG = "AudioPlayerManager"
    
    var avPlayer:AVAudioPlayer!
    var listNames:[String] = []
    var listPlayer:[AVAudioPlayer] = []
//    var currPlayer:AVAudioPlayer!
    var isStop:Bool = false
    
    // impl AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool){
//        Log.print(TAG, msg: "play Finish, \(player.accessibilityValue)")
        if(isStop == false){
             if (listPlayer.count > 0){
                listPlayer.removeAtIndex(0)
                playSound()
            }
        }
    }
    
    /* if an error occurs while decoding it will be reported to the delegate. */
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!){
        Log.print(TAG, msg: "play Error")

    }
    /// end AVAudioPlayerDelegate
    
    func setFileNameStr(filename: String){
        setFileName(filename.componentsSeparatedByString(" "))
    }
    
    func setFileName(listNames:[String]){
        var error: NSError?
        self.listNames = listNames
        for name1 in listNames {
            var name:String = name1.stringByReplacingOccurrencesOfString(" ", withString: "")
            if !name.isEmpty && name != "" {
                let fileURL:NSURL = NSBundle.mainBundle().URLForResource("Sound/\(name.lowercaseString)", withExtension: "mp3")!
                var avPlayer = AVAudioPlayer(contentsOfURL: fileURL, fileTypeHint: AVFileTypeMPEGLayer3, error: &error)
                listPlayer.append(avPlayer)
                if avPlayer == nil {
                    if let e = error {
                        println(e.localizedDescription)
                    }
                } else {
                    avPlayer.delegate = self
                    avPlayer.prepareToPlay()
                }
            }

        }
    }
    
    func playSound(){
//        var avPlayer =
        if (listPlayer.count > 0){
            var currPlayer = listPlayer[0]
            currPlayer.play()
            Log.print(TAG, msg: "playSound count:\(listPlayer.count)")

//            listPlayer.removeAtIndex(0)
            isStop = false
        } else {
            isStop = true
        }
    }
    
//    func stopSound(){
//        isStop = true
//        if let player = currPlayer {
//            currPlayer.stop()
//        }
//    }
    
//    func playSound(soundName: String){
////        self.listFile = listFile
//        
//        let fileURL:NSURL = NSBundle.mainBundle().URLForResource(soundName, withExtension: "mp3")!
//        
//        // the player must be a field. Otherwise it will be released before playing starts.
//        var error: NSError?
//        //        self.avPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: &error)
//        self.avPlayer = AVAudioPlayer(contentsOfURL: fileURL, fileTypeHint: AVFileTypeMPEGLayer3, error: &error)
//        if avPlayer == nil {
//            if let e = error {
//                println(e.localizedDescription)
//            }
//        } else {
//            avPlayer.delegate = self
//            avPlayer.prepareToPlay()
//        }
//        
////        avPlayer.delegate = self
////        avPlayer.prepareToPlay()
//    }

}


