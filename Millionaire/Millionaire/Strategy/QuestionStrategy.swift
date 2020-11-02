//
//  QuestionStrategy.swift
//  Millionaire
//
//  Created by Mac on 01.11.2020.
//

import Foundation

protocol QuestionStrategy {
    func setQuestions(questions: [Question]) -> [Question]
}
