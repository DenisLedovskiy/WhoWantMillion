//
//  MementoAddQuestion.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 18.03.2022.
//

import Foundation

class MementoAddQuestion {

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private let key = "records"

    func save(records: [Questions]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveRecords() -> [Questions] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Questions].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

