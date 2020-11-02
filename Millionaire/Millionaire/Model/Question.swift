//
//  Question.swift
//  Millionaire
//
//  Created by Mac on 28.10.2020.
//

import Foundation
struct Question: Codable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var correctAnswer: String
}
