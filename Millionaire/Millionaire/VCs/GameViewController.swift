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
    var numberOfQuestion = Observable<Int>(0)
   
    private var questionStrategy: QuestionStrategy  {
        switch Game.shared.difficulty {
        case .easy:
            return QuestionsInOrderStrategy()
        case.hard:
            return QuestionsRandomStrategy()
        }
    }
   
   private var questions: [Question] = [Question(question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?", answer1: "На гуслях", answer2: "На виолончели", answer3: "На баяне", answer4: "На гитаре", correctAnswer: "На гуслях"), Question(question: "В какой из этих стран один из официальных языков - французский?", answer1: "Республика Гаити", answer2: "Кения", answer3: "Эквадор", answer4: "Венесуэла", correctAnswer: "Республика Гаити"), Question(question: "В каком году произошла Куликовская битва?", answer1: "1380", answer2: "1590", answer3: "1900", answer4: "1310", correctAnswer: "1380"), Question(question: "Кто автор музыки к детской песенке Чунга-Чанга?", answer1: "Шаинский", answer2: "Зацепин", answer3: "Дербенёв", answer4: "Шпиц", correctAnswer: "Шаинский"), Question(question: "Какая картина Малевича находится в Русском музее?", answer1: "Красный квадрат", answer2: "Белый квадрат", answer3: "Чёрный квадрат", answer4: "Точильщик", correctAnswer: "Красный квадрат")]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Game.shared.addedQuestions + questions
        print(Game.shared.addedQuestions)
        questions = questionStrategy.setQuestions(questions: questions)
        configureButtonsAndLabels()
        numberOfQuestion.addObserver(self, options: [.new, .initial], closure: { [weak self] (numberOfQuestion, _) in
            self!.countLabel.text = "Вопрос номер: \(numberOfQuestion + 1)   Пройдено: \(numberOfQuestion * 100 / self!.questions.count)%"
        })
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
        numberOfQuestion.value += 1
        switch buttonNamber {
        case 1:
            playerAnswer = questions[numberOfQuestion.value - 1].answer1
        case 2:
            playerAnswer = questions[numberOfQuestion.value - 1].answer2
        case 3:
            playerAnswer = questions[numberOfQuestion.value - 1].answer3
        case 4:
            playerAnswer = questions[numberOfQuestion.value - 1].answer4
        default:
            return
        }
        guard numberOfQuestion.value != questions.count else {
            numberOfQuestion.value += 1
            endOfGame()
            return}
        if isItCorrect(playerAnswer: playerAnswer) {
            configureButtonsAndLabels()
        } else {
            endOfGame()
        }
        
    }
    private func isItCorrect(playerAnswer: String) -> Bool {
        if playerAnswer == questions[numberOfQuestion.value - 1].correctAnswer {
            return true
        } else {
            return false
        }
        
    }
    
    private func endOfGame() {
        endGame?(numberOfQuestion.value - 1, questions.count)
        dismiss(animated: true)
    }
    private func configureButtonsAndLabels() {
        
      //  countLabel.text = String("Вопрос номер : \(numberOfQuestion.value + 1) из \(questions.count)")
        questionLabel.text = questions[numberOfQuestion.value].question
        questionLabel.font = UIFont(name: "Futura", size: 30)
        firstPossibleAnswerButton.setTitle(questions[numberOfQuestion.value].answer1, for: .normal)
        secondPossibleAnswerButton.setTitle(questions[numberOfQuestion.value].answer2, for: .normal)
        thirdPossibleAnswerButton.setTitle(questions[numberOfQuestion.value].answer3, for: .normal)
        fourthPossibleAnswerButton.setTitle(questions[numberOfQuestion.value].answer4, for: .normal)
    }
    
}
