//
//  LoginCoordinator.swift
//  App
//
//  Created by Luiz Hartmann on 19/11/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let view = LoginViewController()
        self.navigationController.pushViewController(view, animated: true)
    }
}
