//
//  ResultsTableViewController.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 22.03.2023.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    var items = [String] ()
    let cellId = Constants.resultsCellId
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
