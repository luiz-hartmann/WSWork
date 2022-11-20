//
//  HTTPRequest.swift
//  App
//
//  Created by Luiz Hartmann on 19/11/22.
//

import Foundation

struct Endpoint: Route {
    var baseURL: String
    var path: String
    var parameters: Any?
    var method: HTTPMethod
}
