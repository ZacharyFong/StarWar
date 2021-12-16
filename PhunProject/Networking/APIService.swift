//
//  APIService.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
