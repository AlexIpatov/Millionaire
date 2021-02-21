//
//  Game.swift
//  Millionaire
//
//  Created by Mac on 28.10.2020.
//

import Foundation
class Game {
    public static let shared = Game()
    private let recordsCaretaker = RecordsCaretaker()
    private let questionCaretaker = AddQestionCaretaker()
    private(set)  var gameSessions: [GameSession] {
        didSet {
            recordsCaretaker.saveRecords(records: gameSessions)
        }
    }
    private(set)  var addedQuestions: [Question] {
        didSet {
            questionCaretaker.saveQuestion(records: addedQuestions)
        }
    }
    var difficulty: Difficulty = .easy
    private init() {
        gameSessions = recordsCaretaker.loadRecords() ?? []
        addedQuestions = questionCaretaker.loadQuestions() ?? []
    }
    func addSession(gameSession: GameSession) {
        gameSessions.append(gameSession)
    }
    func addQuestion(question: Question) {
        addedQuestions.append(question)
    }
    func clearGameSessions(){
        gameSessions.removeAll()
    }
    func clearQuestions(){
        addedQuestions.removeAll()
    }
    
}
