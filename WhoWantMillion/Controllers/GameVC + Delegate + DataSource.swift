//
//  GameVC + Delegate + DataSource.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 02.03.2022.
//

import UIKit

extension GameViewControler: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let testQuestion = questionArray[indexQuestion].answers[indexPath.row].self

        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = testQuestion
            return cell ?? UITableViewCell()
        case 1:
            cell?.textLabel?.text = testQuestion
            return cell ?? UITableViewCell()
        case 2:
            cell?.textLabel?.text = testQuestion
            return cell ?? UITableViewCell()
        case 3:
            cell?.textLabel?.text = testQuestion
            return cell ?? UITableViewCell()
        default:
            return cell ?? UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        if indexPath.row == questionArray[indexQuestion].idRightAnswer {
        if questionCounter < 4 {
            questionCounter += 1
            print(delegate?.getGameStat(rightQuestion: questionCounter, balance: prize))
            prize *= 2
            indexQuestion += 1
            setLabelsText()
            DispatchQueue.main.async { [self] in

                self.answerTable.reloadData()
            }
        }
        } else {
            var winRate = 0
            if questionCounter > 0 {
                winRate = questionCounter/(questionArray.count/100) }
            session.session?.balance = prize/2
            session.session?.rightQuestionCounter = questionCounter
            session.rezults.append(Rezults(idGame: 1, procentWin:  winRate))
            performSegue(withIdentifier: "fromGameToMenu", sender: Any.self)

        }
    }

}
