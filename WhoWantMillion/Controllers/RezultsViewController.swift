//
//  RezultsViewController.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 10.03.2022.
//

import UIKit

class RezultsViewController: UIViewController {


    @IBOutlet weak var rezultsTableView: UITableView!

    var careTaker = CareTaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        Game.instance.rezults = careTaker.retrieveRecords()
        
        rezultsTableView.dataSource = self
        rezultsTableView.delegate = self
        
    }
    
}

extension RezultsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if careTaker.retrieveRecords().count != 0 {
            return careTaker.retrieveRecords().count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "rezultCell")
        let rightAnswer = Game.instance.rezults[indexPath.row].rightAnswers
        let balance = Game.instance.rezults[indexPath.row].balance
        let winRate = Game.instance.rezults[indexPath.row].winRate

        if Game.instance.rezults.isEmpty {
            cell?.textLabel?.text = "Нет результатов"
        } else {
            cell?.textLabel?.text = "Ответов: \(rightAnswer) (\(winRate)%), выигрыш \(balance) рублей."
        }

        return cell ?? UITableViewCell()
    }



}
