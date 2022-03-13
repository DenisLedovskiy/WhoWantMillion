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


    func getGameRigtQustions(rightQuestion: Int) {

        rightQuestionCounter = rightQuestion
    }

    func getGameBalance(balance: Int) {

        self.balance = balance
    }
    
}
