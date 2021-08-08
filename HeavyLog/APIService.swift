//
//  APIService.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 08/08/2021.
//

import Combine
import Foundation

final class APIService: APIProvider {
    static let shared = APIService()

    private let decoder = JSONDecoder()

    func getData<T: Decodable>(from url: URL) -> AnyPublisher<T, AppError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .mapError { .decodingError($0) }
            .eraseToAnyPublisher()
    }

    func getData<T: Decodable>(fromFile fileName: String, withExtension fileExtension: String) -> AnyPublisher<T, AppError> {
        getUrl(forFile: fileName, withExtension: fileExtension)
            .flatMap { [unowned self] url in getData(from: url) }
            .eraseToAnyPublisher()
    }

    private func getUrl(forFile fileName: String, withExtension fileExtension: String) -> AnyPublisher<URL, AppError> {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            let error = URLError(.fileDoesNotExist, userInfo: [:])
            return Result.failure(.urlError(error)).publisher.eraseToAnyPublisher()
        }
        return Result.success(url).publisher.eraseToAnyPublisher()
    }
}
