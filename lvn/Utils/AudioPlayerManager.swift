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
    
//    var avPlayer1:AVAudioPlayer! 
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
        //test
//        readFileIntoAVPlayer()
        ///
        
        var error: NSError?
        self.listNames = listNames
        
        stopSound()
        
        for name1 in listNames {
            var name:String = name1.stringByReplacingOccurrencesOfString(" ", withString: "")
            if !name.isEmpty && name != "" {
                let fileURL:NSURL = NSBundle.mainBundle().URLForResource("Sound/\(name.lowercaseString)", withExtension: "mp3")!
//                let fileURL:NSURL = NSBundle.mainBundle().URLForResource("vn", withExtension: "mp3")!

                var avPlayer = AVAudioPlayer(contentsOfURL: fileURL, fileTypeHint: AVFileTypeMPEGLayer3, error: &error)
                listPlayer.append(avPlayer)
                if avPlayer == nil {
                    if let e = error {
                        println(e.localizedDescription)
                    }
                } else {
                    avPlayer.delegate = self
                    avPlayer.prepareToPlay()
                    avPlayer.volume = 1.0
                }
            }

        }
    }
    
    func playSound(){
//        avPlayer1.play()
        if (listPlayer.count > 0){
            var currPlayer = listPlayer[0]
            setSessionPlayback()
            currPlayer.play()
            Log.print(TAG, msg: "playSound count:\(listPlayer.count)")
            isStop = false
        } else {
            isStop = true
        }
    }
    ///
    func stopSound(){
        listPlayer = []
        isStop = true
    }
    
    // TH play ko nghe tieng, goi ham nay se dung duoc
    func setSessionPlayback() {
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        var error: NSError?
        if !session.setCategory(AVAudioSessionCategoryPlayback, error:&error) {
            println("could not set session category")
            if let e = error {
                println(e.localizedDescription)
            }
        }
        if !session.setActive(true, error: &error) {
            println("could not make session active")
            if let e = error {
                println(e.localizedDescription)
            }
        }
    }

}


