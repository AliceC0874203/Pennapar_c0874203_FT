//
//  ShowProgressTVC.swift
//  Pennapar_c0874203_FT
//
//  Created by Alice’z Poy on 2022-11-07.
//

import Foundation
import UIKit

class ShowProgressTVC: UITableViewController {
    var results: [ResultObjProtocol]?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowProgressViewCell", for: indexPath) as? ShowProgressViewCell
        if let result = results?[indexPath.row] {
            cell?.resultLabel.text = "\(result.number) \(result.isOdd ? "is Odd" : "is Even")"
            cell?.resultImageView.image = UIImage(named: "\(result.answerIsCorrect ? "Correct" : "InCorrect")")
        }
        return cell ?? UITableViewCell()
    }
}
