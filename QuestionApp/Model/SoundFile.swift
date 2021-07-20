//
//  SoundFile.swift
//  QuestionApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import Foundation
import AVFoundation

class SoundFile {
    
    var player:AVAudioPlayer?
    
    func playSound(fileName:String,extensionName:String){
        
        //再生する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do {
            //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        } catch  {
            //エラーが起きた時
            print("エラーです！")
        }
        
    }
    
}
