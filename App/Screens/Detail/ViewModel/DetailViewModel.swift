//
//  DetailViewModel.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

class DetailViewModel {
    
    var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var marcaNome: String {
        return "Marca: \(self.car.marcaNome)"
    }
    
    var nomeModelo: String {
        return "Modelo: \(self.car.nomeModelo)"
    }
    
    var ano: String {
        return "Ano: \(self.car.ano ?? String.empty)"
    }
    
    var combustivel: String {
        return "Combustível: \(self.car.combustivel)"
    }
    
    var numPortas: String {
        return "N° de Portas: \(self.car.numPortas)"
    }
    
    var cor: String {
        return "Marca: \(self.car.cor)"
    }
}
