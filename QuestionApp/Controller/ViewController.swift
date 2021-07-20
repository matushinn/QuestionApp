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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func answer(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            //丸ボタンが押された時
            
            //ユーザーが押したボタンが丸ボタンだった
        
            //丸ボタンの音声を流す
            
        }else if (sender as AnyObject).tag == 2{
            //バツボタンが押された時
            
            //ユーザーが押したボタンがバツボタンだった
            
            //バツボタンの音声を流す
            
        }
    }
    

}

