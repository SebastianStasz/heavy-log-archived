//
//  APIProvider.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 08/08/2021.
//

import Combine
import Foundation

public protocol APIProvider {
    func getData<T: Decodable>(from url: URL) -> AnyPublisher<T, AppError>
    func getData<T: Decodable>(fromFile fileName: String, withExtension fileExtension: String) -> AnyPublisher<T, AppError>
}
