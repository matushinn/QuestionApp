//
//  ChangeColor.swift
//  QuestionApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import Foundation
import UIKit

//このように分けるのが一般的である。

class ChangeColor {
    
    
    func changeColor(topR:CGFloat,topG:CGFloat,topB:CGFloat,topAlpha:CGFloat,bottomR:CGFloat,bottomG:CGFloat,bottomB:CGFloat,bottomAlpha:CGFloat) -> CAGradientLayer{
        
        //グラデーションの開始色
        let topColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        let bottomColor = UIColor(red: bottomR, green: bottomG, blue: bottomB, alpha: bottomAlpha)
            
        //グラデーションの色を配列で管理する
        let gradientColor = [topColor.cgColor,bottomColor.cgColor]
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColor
        
        return gradientLayer
        
        
        
        
    }
}
