//
//  NextViewController.swift
//  QuestionApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import UIKit

protocol nowScoreDelegate {
    
    func nowScore(score:Int)
}

class NextViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var wrongLabel: UILabel!
    
    var delegate:nowScoreDelegate?
    
    var correctedCount  = Int()
    var wrongCount = Int()
    
    var beforeCount = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongCount)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil {
            beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
        }
        
    }
    @IBAction func back(_ sender: Any) {
        
        //もし最高得点であれば、入れ替え
        if beforeCount <= correctedCount {
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            delegate?.nowScore(score: correctedCount)
        }else if beforeCount > correctedCount{
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        
        //そうでない場合は、入れ替えない
        dismiss(animated: true, completion: nil)
    }
    

    

}
