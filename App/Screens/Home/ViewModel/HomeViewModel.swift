//
//  HomeViewModel.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

class HomeViewModel {
    var client = Client()
    var model: [Car] = []
    var reloadTableView: (() -> Void)?
    
    func load() {
        client.fetchCars() { response in
            switch response {
            case .success(let cars):
                self.model = cars
                self.reloadTableView?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRows(indexPath: IndexPath) -> Car {
        return model[indexPath.row]
    }
    
    func listAtIndex() -> Int {
        return model.count
    }
}
