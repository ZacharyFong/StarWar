//
//  APIError.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import Foundation

enum APIError: Error {
    case badResponse(statusCode: Int)
    case parsing
    case unknown
}
