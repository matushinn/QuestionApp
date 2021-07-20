//
//  ImagesModel.swift
//  QuestionApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import Foundation


class ImagesModel {
    //画像名を取得して、その画像名が人間かそうでないかをフラグによって判定するための機能
    
    let imageText:String?
    let answer:Bool
    
    init(imageName:String,correctOrNot:Bool) {
        imageText = imageName
        answer = correctOrNot
    }
    
}
