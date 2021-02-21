//
//  QuestionsRandomStrategy.swift
//  Millionaire
//
//  Created by Mac on 01.11.2020.
//

import Foundation

class QuestionsRandomStrategy: QuestionStrategy {
    func setQuestions(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
    
  
    
  
}
