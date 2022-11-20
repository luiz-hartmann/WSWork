//
//  RegisterCoordinator.swift
//  App
//
//  Created by Luiz Hartmann on 19/11/22.
//

import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let view = RegisterViewController()
        view.coordinator = self
        self.navigationController.pushViewController(view, animated: true)
    }
    
    func presentLoginView() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
