//
//  ResultsTableViewController.swift
//  Millionaire
//
//  Created by Mac on 01.11.2020.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.gameSessions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultVC", for: indexPath) as? ResultsTableViewCell else {return UITableViewCell()}
        let gameSession = Game.shared.gameSessions
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        let date = formatter.string(from: gameSession[indexPath.row].date)
        cell.resultLabel.text = String("\(date)   \(gameSession[indexPath.row].percentagGuessed)% ")
        return cell
    }

}
