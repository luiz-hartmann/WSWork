//
//  HomeCoordinator.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let view = HomeViewController()
        view.coordinator = self
        self.navigationController.pushViewController(view, animated: true)
    }
    
    func didSelect(car: Car) {
        let coordinator = DetailCoordinator(navigationController: navigationController, viewModel: DetailViewModel(car: car))
        coordinator.start()
    }
}
