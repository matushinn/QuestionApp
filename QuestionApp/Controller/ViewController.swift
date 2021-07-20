//
//  ViewController.swift
//  QuestionApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    //初期化完了
    let imagesList = ImagesList()
    
    //IBActionで検知した正答がどちらかを取得する変数
    var pickedAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func answer(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            //丸ボタンが押された時
            pickedAnswer = true
            //ユーザーが押したボタンが丸ボタンだった
        
            //丸ボタンの音声を流す
            
        }else if (sender as AnyObject).tag == 2{
            //バツボタンが押された時
            pickedAnswer = false
            
            //ユーザーが押したボタンがバツボタンだった
            
            //バツボタンの音声を流す
            
        }
        
        //チェック、回答があっているか(pickedAnswerとImageListのcorrectOrNotの値が一致しているかどうか)
        
    }
    

}

