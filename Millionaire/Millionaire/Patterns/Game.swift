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
    private(set)  var gameSessions: [GameSession] {
        didSet {
            recordsCaretaker.saveRecords(records: gameSessions)
        }
    }
    private init() {
        gameSessions = recordsCaretaker.loadRecords() ?? []
    }
    func addSession(gameSession: GameSession) {
        gameSessions.append(gameSession)
    }
    func clear(){
        gameSessions.removeAll()
    }
    
}
