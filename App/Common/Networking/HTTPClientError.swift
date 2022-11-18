//
//  HTTPClientError.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

enum HTTPClientError: Error {
    case missingData
    case invalidURL
    case invalidStatusCode
    case requestFailed
    case parseError
}

extension HTTPClientError: LocalizedError {
    var description: String? {
        switch self {
        case .missingData:
            return "Error: did not receive data"
        case .invalidURL:
            return "Error: The URL is invalid"
        case .invalidStatusCode:
            return "Error: Invalid status code"
        case .requestFailed:
            return "Error: HTTP request failed"
        case .parseError:
            return "Error: Bad parsing"
        }
    }
}
