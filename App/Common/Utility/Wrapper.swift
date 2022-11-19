//
//  Wrapper.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

@propertyWrapper
struct StringForcible: Codable {
    
    var wrappedValue: String?
    
    enum CodingKeys: CodingKey {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            wrappedValue = string
        } else if let integer = try? container.decode(Int.self) {
            wrappedValue = "\(integer)"
        } else if let double = try? container.decode(Double.self) {
            wrappedValue = "\(double)"
        } else if container.decodeNil() {
            wrappedValue = nil
        }
        
        else {
            throw DecodingError.typeMismatch(String.self, .init(codingPath: container.codingPath,
                                                                debugDescription: "Could not decode incoming value to String. It is not a type of String, Int or Double."))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
    
    init() {
        self.wrappedValue = nil
    }
}
