//
//  Questions.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 02.03.2022.
//

import Foundation

struct Questions: Codable {

    var numberOfQuestion: Int
    var question: String
    var answers: [Int: String]
    var idRightAnswer: Int
}
