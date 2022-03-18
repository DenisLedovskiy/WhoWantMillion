//
//  StrategyQuestion.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 18.03.2022.
//

import Foundation

protocol StrategyQuestions {

    func getQuestion (question: [Questions]) -> [Questions]
}

class StrategyQuestionConsistent: StrategyQuestions {

    func getQuestion(question: [Questions]) -> [Questions] {

        return question.sorted (by: { $0.numberOfQuestion < $1.numberOfQuestion })
    }

}

class StrategyQuestionRandom: StrategyQuestions {

    func getQuestion(question: [Questions]) -> [Questions] {

        question.shuffled()
    }

}


