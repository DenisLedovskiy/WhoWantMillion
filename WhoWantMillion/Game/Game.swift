//
//  Game.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 04.03.2022.
//

import Foundation

class Game {

    private init () {}

    static let instance = Game()

    var session: GameSession?
    var rezults = [Rezults]()
    var careTaker = CareTaker()
    var gameStrategy: [StrategyQuestions] = [StrategyQuestionRandom(), StrategyQuestionConsistent()]
    var currentStrategy = 1


    func calcRezults() {
        guard let gameSession = self.session else {return}
        let rightAnswer = gameSession.rightQuestionCounter
        let prize = gameSession.balance
        let winRate = gameSession.winRate
        self.rezults.append(Rezults(rightAnswers: rightAnswer, balance: prize, winRate: winRate))
        careTaker.save(records: rezults)
        self.session = nil
    }

}

struct Rezults: Codable {

    var rightAnswers: Int
    var balance: Int
    var winRate: Int


}