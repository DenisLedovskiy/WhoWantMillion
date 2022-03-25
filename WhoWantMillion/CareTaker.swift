//
//  CareTaker.swift
//  WhoWantMillion
//
//  Created by Денис Ледовский on 06.03.2022.
//

import Foundation

// Для теста гита

class CareTaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private let key = "records"

    func save(records: [Rezults]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveRecords() -> [Rezults] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Rezults].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
