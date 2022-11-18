//
//  Car.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

struct Car: Codable {
    let id: Int
    let marcaID: Int
    let marcaNome: String
    let nomeModelo: String
    let ano: Ano
    let combustivel: String
    let numPortas: Int
    let valorFipe: ValorFipe
    let cor: String
    let timestampCadastro: Ano
    
    enum CodingKeys: String, CodingKey {
        case id
        case marcaID = "marca_id"
        case marcaNome = "marca_nome"
        case nomeModelo = "nome_modelo"
        case ano, combustivel
        case numPortas = "num_portas"
        case valorFipe = "valor_fipe"
        case cor
        case timestampCadastro = "timestamp_cadastro"
    }
}


enum Ano: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Int.self) {
            self = .integer(value)
            return
        }
        
        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }
        throw DecodingError.typeMismatch(Ano.self,
                                         DecodingError.Context(codingPath: decoder.codingPath,
                                                               debugDescription: "Wrong type for Ano"))
    }
}

enum ValorFipe: Codable {
    case double(Double)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Double.self) {
            self = .double(value)
            return
        }
        
        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }
        throw DecodingError.typeMismatch(ValorFipe.self,
                                         DecodingError.Context(codingPath: decoder.codingPath,
                                                               debugDescription: "Wrong type for ValorFipe"))
    }
}

