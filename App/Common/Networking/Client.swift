//
//  Client.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

class Client: HTTPClientProtocol {
    func fetchCars(completion: @escaping (Result<[Car], HTTPClientError>) -> Void) {
        let route = Endpoint(baseURL: "https://wswork.com.br/", path: "cars.json", method: .get)
        request(request: route.request, completion: completion)
    }
    
    func user(username: String, password: String, completion: @escaping (Result<User, HTTPClientError>) -> Void) {
        let parameters = ["username": username, "password": password]
        let route = Endpoint(baseURL: "https://wswork.com.br/", path: "/cars/leads/", parameters: parameters, method: .post)
        request(request: route.request, completion: completion)
    }
}
