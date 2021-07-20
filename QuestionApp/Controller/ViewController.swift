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
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    
    //初期化完了
    let imagesList = ImagesList()
    
    //IBActionで検知した正答がどちらかを取得する変数
    var pickedAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText!)
        
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
        check()
        //ボタンが押されたら次の質問に行く。
        nextQuestions()
        
    }
    
    func check(){
        let correctAnswer = imagesList.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            print("正解")
            correctCount += 1
        }else{
            print("間違い")
            wrongCount += 1
        }
        
    }
    
    func nextQuestions(){
        if questionNumber <= 9{
            questionNumber += 1
            imageView.image = UIImage(named: imagesList.list[questionNumber
            ].imageText!
            )
        }else{
            print("問題が終了")
            //画面遷移
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    //画面が遷移する時の処理　performSegueが呼ばれた後に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextVC = segue.destination as! NextViewController
            
            nextVC.correctedCount = correctCount
            nextVC.wrongCount = wrongCount
            
        }
    }
    

}

