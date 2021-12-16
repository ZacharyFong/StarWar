//
//  StarWarService.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import Foundation
import Combine

protocol StarWarService {
    var apiSession: APIService {get}
    
    func getStarWarList() -> AnyPublisher<[StarWarData], APIError>
}

extension StarWarService {
    
    func getStarWarList() -> AnyPublisher<[StarWarData], APIError> {
        return apiSession.request(with: StarWarEndpoint.StarWarList)
            .eraseToAnyPublisher()
    }
}
