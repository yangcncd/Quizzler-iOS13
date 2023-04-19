//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! 
        
        if(quizBrain.checkAnswer(userAnswer)){
            sender.backgroundColor = UIColor.green
            quizBrain.addScore()
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false,
                             block: { _ in self.updateUI()
        })
        //self.updateUI()
    }
    
    func updateUI(){
        self.progressBar.progress = quizBrain.getProgress()
        self.scoreLabel.text = "Score: \(quizBrain.getScore())"
         
        questionLabel.text = quizBrain.getQuestionText()
        clearButtonBackgroundColor()
    }
    
    func clearButtonBackgroundColor(){
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

