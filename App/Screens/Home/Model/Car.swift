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
    @StringForcible var ano: String?
    let combustivel: String
    let numPortas: Int
    let valorFipe: StringForcible?
    let cor: String
    let timestampCadastro: StringForcible?
    
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



