//
//  CodingService.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/09/2021.
//

import Foundation

final class CodingService {

    private let encoder = { () -> JSONEncoder in
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()

    func getJsonString<T: Encodable>(from data: T) -> String? {
        do { return try encode(data) }
        catch { handleError(error) ; return nil }
    }
}

// MARK: - Private

extension CodingService {

    private func handleError(_ error: Error) {
        print(error.localizedDescription)
    }

    private func encode<T: Encodable>(_ data: T) throws -> String? {
        let jsonData = try encoder.encode(data)
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            return nil
        }
        return jsonString
    }
}
