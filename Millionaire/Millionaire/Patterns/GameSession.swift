//
//  GameSession.swift
//  Millionaire
//
//  Created by Mac on 28.10.2020.
//

import Foundation

struct GameSession: Codable {
    let date: Date
    let numberOfQuestions: Int
    let numberOfCorrectAnswers: Int
    var percentagGuessed: Int{
        let percentagGuessed = (Double(numberOfCorrectAnswers) * 100 / Double(numberOfQuestions))
        return Int(percentagGuessed)
    }
}


    
    

