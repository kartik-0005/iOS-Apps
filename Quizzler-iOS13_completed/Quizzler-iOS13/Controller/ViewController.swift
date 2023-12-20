//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
  
    var quizBrain=QuizBrain()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateValue()
        
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let userAnswer=sender.currentTitle!
       let userGotItRight=quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight==true{
            sender.backgroundColor=UIColor.green
            
        }
        else{
            sender.backgroundColor=UIColor.red
        }
            
       
    
        quizBrain.nextQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateValue) , userInfo: nil, repeats: false)
        
     
       
    }
    @objc func updateValue(){
        questionLabel.text=quizBrain.getQuestionText()
        progressBar.progress=quizBrain.getProgress()// as question no starts from zero so we add +1
        trueButton.backgroundColor=UIColor.clear
        falseButton.backgroundColor=UIColor.clear
        scoreLabel.text=("Score : \(quizBrain.getScore())")
        
    }

}

