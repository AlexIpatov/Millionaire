//
//  SettingsViewController.swift
//  Millionaire
//
//  Created by Mac on 01.11.2020.
//

import UIKit

class SettingsViewController: UIViewController {
    let alert = UIAlertController(title: "Память очищена!", message: nil, preferredStyle: .alert)
  
    @IBOutlet weak var difficultySegmentedControl: UISegmentedControl!
    
    @IBAction func clearQuestionsButton(_ sender: UIButton) {
        Game.shared.clearQuestions()
        present(alert, animated: true)
    }
    
    @IBAction func clearGameSessionButton(_ sender: UIButton) {
        Game.shared.clearGameSessions()
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }
    override func viewDidDisappear(_ animated: Bool) {
        Game.shared.difficulty = selectedDifficulty
    }
    private var selectedDifficulty: Difficulty {
        switch self.difficultySegmentedControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .hard
        default:
            return .easy
        }
    }

}
