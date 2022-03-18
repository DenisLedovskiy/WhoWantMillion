//
//  GameSession.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 04.03.2022.
//

import UIKit

class GameSession: GameSessionDelegate {

    var numberOfGame = 0
    var rightQuestionCounter = 0
    var balance = 0
    var winRate = 0



    func getGameRigtQustions(rightQuestion: Int) {
        NotificationCenter.default.post(name: Notification.Name("winRate"), object: nil)
        rightQuestionCounter = rightQuestion
    }

    func getGameBalance(balance: Int) {

        self.balance = balance
    }

    func getGameWinRate(winRateProcent: Int) {
        winRate = winRateProcent
    }
    
}
