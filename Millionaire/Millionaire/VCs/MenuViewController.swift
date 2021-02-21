//
//  ViewController.swift
//  Millionaire
//
//  Created by Mac on 28.10.2020.
//

import UIKit

class MenuViewController: UIViewController {
  
    @IBOutlet weak var results: UIButton!
    @IBAction func results(_ sender: UIButton) {}
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toGameVC":
            if let destination = segue.destination as? GameViewController {
                destination.endGame = { [weak self] (score, numberQuestions) in
                    guard self != nil else { return }
                    let gameSession = GameSession(date: Date(), numberOfQuestions:numberQuestions, numberOfCorrectAnswers: score)
                     Game.shared.addSession(gameSession: gameSession)
                    self?.results.setTitle("Вы отгадали \(score) из \(numberQuestions) вопросов", for: .normal)
                }
            }
        
        default:
            break
        }
    }
    @IBAction func startButton(_ sender: UIButton) {
             performSegue(withIdentifier: "toGameVC", sender: self)
      
       }
}


