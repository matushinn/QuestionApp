//
//  Human.swift
//  QuestionApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import Foundation


class Human:Animal {
    override func breath() {
        super.breath()
        profile()
    }
    
    
    func profile(){
        print("私は大江祥太郎です。")
    }
}
