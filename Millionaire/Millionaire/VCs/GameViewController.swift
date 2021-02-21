//
//  GameViewController.swift
//  Millionaire
//
//  Created by Mac on 28.10.2020.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstPossibleAnswerButton: UIButton!
    @IBOutlet weak var secondPossibleAnswerButton: UIButton!
    @IBOutlet weak var thirdPossibleAnswerButton: UIButton!
    @IBOutlet weak var fourthPossibleAnswerButton: UIButton!
    var endGame: ((Int, Int) -> Void)?
    var playerAnswer = ""
    var numberOfQuestion = 0
    var questions: [Question] = [Question(question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?", answer1: "На гуслях", answer2: "На виолончели", answer3: "На баяне", answer4: "На гитаре", correctAnswer: "На гуслях"), Question(question: "В какой из этих стран один из официальных языков - французский?", answer1: "Республика Гаити", answer2: "Кения", answer3: "Эквадор", answer4: "Венесуэла", correctAnswer: "Республика Гаити"), Question(question: "В каком году произошла Куликовская битва?", answer1: "1380", answer2: "1590", answer3: "1900", answer4: "1310", correctAnswer: "1380"), Question(question: "Кто автор музыки к детской песенке Чунга-Чанга?", answer1: "Шаинский", answer2: "Зацепин", answer3: "Дербенёв", answer4: "Шпиц", correctAnswer: "Шаинский"), Question(question: "Какая картина Малевича находится в Русском музее?", answer1: "Красный квадрат", answer2: "Белый квадрат", answer3: "Чёрный квадрат", answer4: "Точильщик", correctAnswer: "Красный квадрат")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonsAndLabels()
    }
    
    @IBAction func firstPossibleAnswerButton(_ sender: UIButton) {
        checkAnswer(buttonNamber: 1)
    }
    @IBAction func secondPossibleAnswerButton(_ sender: UIButton) {
        checkAnswer(buttonNamber: 2)
    }
    @IBAction func thirdPossibleAnswerButton(_ sender: UIButton) {
        checkAnswer(buttonNamber: 3)
    }
    @IBAction func fourthPossibleAnswerButton(_ sender: UIButton) {
        checkAnswer(buttonNamber: 4)
    }
    
    
    private func checkAnswer(buttonNamber: Int) {
        numberOfQuestion += 1
        switch buttonNamber {
        case 1:
            playerAnswer = questions[numberOfQuestion - 1].answer1
        case 2:
            playerAnswer = questions[numberOfQuestion - 1].answer2
        case 3:
            playerAnswer = questions[numberOfQuestion - 1].answer3
        case 4:
            playerAnswer = questions[numberOfQuestion - 1].answer4
        default:
            return
        }
        guard numberOfQuestion != questions.count else {
            numberOfQuestion += 1
            endOfGame()
            return}
        if isItCorrect(playerAnswer: playerAnswer) {
            configureButtonsAndLabels()
        } else {
            endOfGame()
        }
        
    }
    private func isItCorrect(playerAnswer: String) -> Bool {
        if playerAnswer == questions[numberOfQuestion - 1].correctAnswer {
            return true
        } else {
            return false
        }
        
    }
    
    private func endOfGame() {
        endGame?(numberOfQuestion - 1, questions.count)
        dismiss(animated: true)
    }
    private func configureButtonsAndLabels() {
        countLabel.text = String("Вопрос номер : \(numberOfQuestion + 1) из \(questions.count)")
        questionLabel.text = questions[numberOfQuestion].question
        questionLabel.font = UIFont(name: "Futura", size: 30)
        firstPossibleAnswerButton.setTitle(questions[numberOfQuestion].answer1, for: .normal)
        secondPossibleAnswerButton.setTitle(questions[numberOfQuestion].answer2, for: .normal)
        thirdPossibleAnswerButton.setTitle(questions[numberOfQuestion].answer3, for: .normal)
        fourthPossibleAnswerButton.setTitle(questions[numberOfQuestion].answer4, for: .normal)
    }
    
}
