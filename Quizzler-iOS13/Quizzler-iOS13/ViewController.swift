//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var progressLabel: UIProgressView!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextQuestion()
    }
    
    func checkAnswer(){
        let correctAnswer = allQuestions.list[questionNumber].answer
        if(correctAnswer == pickedAnswer){
            //print("correct!")
            score = score + 1
            ProgressHUD.show("correct",icon: .succeed,delay: 0.9)
        }else{
            //print("wrong!")
            ProgressHUD.show("wrong",icon: .failed,delay: 0.9)
        }
    }

    func startOver(){
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    
    func nextQuestion()
    {
        if (questionNumber <= 12) {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else {
            let alert  = UIAlertController(title:"Awsome",message: "you are finished all questions,do you want to start over?",preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "restart", style: .default) { UIAlertAction in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true,completion: nil)
            
        }
    }
    
    func updateUI(){
        scoreLabel.text = "score : \(score)"
        questionNumberLabel.text = "\(questionNumber+1) / 13"
        //progressLabel.frame.size.width = ( view.frame.size.width / 13 ) * CGFloat(questionNumber + 1)
    }
    
    @IBAction func btnAnswerPressed(_ sender: UIButton) {
        if(sender.tag==1){
            pickedAnswer = true
            
            //print("picked answer = \(pickedAnswer)")
        }else if(sender.tag==2){
            pickedAnswer = false
            
            //print("picked answer= \(pickedAnswer)")
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    
}

