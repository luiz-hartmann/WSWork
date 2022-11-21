//
//  HTTPClient.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

protocol HTTPClientProtocol {
    func request<T: Decodable>(request: URLRequest,
                               completion: @escaping(Result<T, HTTPClientError>) -> Void)
}

extension HTTPClientProtocol {
    private func decodingTask<T: Decodable>(request: URLRequest,
                                            decodingType: T.Type?,
                                            completion: @escaping (T?, HTTPClientError?) -> Void) -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  (200..<300) ~= response.statusCode else {
                completion(nil, HTTPClientError.invalidStatusCode)
                return
            }
            
            guard let data = data else {
                completion(nil, HTTPClientError.missingData)
                return
            }
            
            guard let decodingType = decodingType else {
                completion(nil, HTTPClientError.missingData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(decodingType, from: data)
                completion(json, nil)
                
            } catch {
                completion(nil, HTTPClientError.parseError)
                
            }
        }
    }
    
    func request<T: Decodable>(request: URLRequest,
                               completion: @escaping (Result<T, HTTPClientError>) -> Void) {
        decodingTask(request: request, decodingType: T.self) { decodable, error in
            if let error = error {
                completion(Result.failure(error))
                return
            }
            
            guard let model = decodable else {
                completion(Result.failure(HTTPClientError.missingData))
                return
            }
            completion(Result.success(model))
        }.resume()
    }
}
