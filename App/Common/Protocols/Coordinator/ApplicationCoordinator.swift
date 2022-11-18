//
//  ApplicationCoordinator.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        coordinator.start()
        childCoordinator.append(coordinator)
    }
}
