//
//  Client.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

struct Endpoint: Route {
    var baseURL: String
    var path: String
    var parameters: Any?
    var method: HTTPMethod
}

class Client: HTTPClientProtocol {
    func fetchCars(completion: @escaping (Result<[Car], HTTPClientError>) -> Void) {
        let route = Endpoint(baseURL: "https://wswork.com.br/", path: "cars.json", method: .get)
        request(request: route.request, completion: completion)
    }
}
