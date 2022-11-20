//
//  Route.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

protocol Route {
    var baseURL: String { get }
    var path: String { get }
    var parameters: Any? { get }
    var method: HTTPMethod { get }
}

extension Route {
    
    var url: URL {
        return URL(string: baseURL + path)!
    }
    
    var headers: [String: String] {
        return [ "Content-Type": "application/json",
                 "Accept": "application/json",
                 "Authorization": "Basic \(baseURL + path)"]
    }
    
    var dataParameters: Data? {
        guard let parameters = parameters else { return nil }
        let data = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        return data
    }
    
    var request: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = dataParameters
        request.allHTTPHeaderFields = headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
