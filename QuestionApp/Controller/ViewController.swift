//
//  ViewController.swift
//  QuestionApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController ,nowScoreDelegate{
    

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
    
    //var withOutMP3 = WithOutMP3()
    var soundFile = SoundFile()
    
    var changeColor = ChangeColor()
    
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        
        imageView.layer.cornerRadius = 20.0
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText!)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil {
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
        }
        maxScoreLabel.text = String(maxScore)
        
        
    }
    
    @IBAction func answer(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            
//            withOutMP3.playSound(fileName: "maruSound", extensionName: "mp3")
            soundFile.playSound(fileName: "maruSound", extensionName: "mp3")
            //丸ボタンが押された時
            pickedAnswer = true
            
            
            
            
            //ユーザーが押したボタンが丸ボタンだった
        
            //丸ボタンの音声を流す
            
        }else if (sender as AnyObject).tag == 2{
            soundFile.playSound(fileName: "batsuSound", extensionName: "mp3")
            
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
    
    func nowScore(score: Int) {
        soundFile.playSound(fileName: "sound", extensionName: "mp3")
        maxScoreLabel.text = String(score)
    }
    
    //画面が遷移する時の処理　performSegueが呼ばれた後に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextVC = segue.destination as! NextViewController
            
            nextVC.correctedCount = correctCount
            nextVC.wrongCount = wrongCount
            nextVC.delegate = self
            
            
        }
    }
    

}

