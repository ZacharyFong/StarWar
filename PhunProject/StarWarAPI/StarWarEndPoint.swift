//
//  StarWarEndPoint.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import Foundation

enum StarWarEndpoint {
    case StarWarList
}

extension StarWarEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .StarWarList:
            guard let url = URL(string: "https://json")
            else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
    }
}
