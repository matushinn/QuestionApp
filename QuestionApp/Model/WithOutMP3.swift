//
//  WithOutMP3.swift
//  QuestionApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import Foundation


//MP3を弾くクラス
class WithOutMP3: SoundFile {
    
    override func playSound(fileName: String, extensionName: String) {
        if extensionName == "mp3"{
            print("このファイルは再生できません。")
        }
        player?.stop()
    }
}
