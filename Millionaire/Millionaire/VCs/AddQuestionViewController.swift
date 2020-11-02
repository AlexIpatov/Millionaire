//
//  AddQuestionViewController.swift
//  Millionaire
//
//  Created by Mac on 01.11.2020.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    var newQuestion: Question?
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var answer4TextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    let alertForEmty = UIAlertController(title: "Заполните все поля!", message: nil, preferredStyle: .alert)
    let alertForNotRightAnswer = UIAlertController(title: "Правильный ответ не совпадает ни с одним из вариантов", message: nil, preferredStyle: .alert)
    @IBAction func addQuestionButton(_ sender: UIButton) {
        guard  questionTextField.text != "" &&  answer1TextField.text != "" && answer2TextField.text != "" && answer3TextField.text != "" && answer4TextField.text != "" && correctAnswerTextField.text != "" else {
            self.present(alertForEmty, animated: true)
            return
        }
        guard  correctAnswerTextField.text == answer1TextField.text || correctAnswerTextField.text == answer2TextField.text || correctAnswerTextField.text == answer3TextField.text || correctAnswerTextField.text == answer4TextField.text else {
            self.present(alertForNotRightAnswer, animated: true)
            return
        }
        
        newQuestion = Question(question: questionTextField.text ?? "", answer1: answer1TextField.text ?? "", answer2: answer2TextField.text ?? "", answer3: answer3TextField.text ?? "", answer4: answer4TextField.text ?? "", correctAnswer: correctAnswerTextField.text ?? "")
        Game.shared.addQuestion(question: newQuestion!)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertConfig()
    }
    
    func alertConfig() {
        alertForEmty.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alertForNotRightAnswer.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }
    
    
    
}
