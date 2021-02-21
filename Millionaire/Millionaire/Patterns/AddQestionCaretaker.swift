//
//  AddQestionCaretaker.swift
//  Millionaire
//
//  Created by Mac on 01.11.2020.
//

import Foundation

class AddQestionCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "AddQestionCaretaker"
    
    func saveQuestion(records: [Question]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadQuestions() -> [Question]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

