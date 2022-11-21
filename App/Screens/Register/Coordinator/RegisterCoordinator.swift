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
    
    func create(userViewModel: UserViewModel) {
        let userViewModel = DBCommands.insertRow(userViewModel)
        
        if userViewModel == true {
            self.navigationController.presentAlert(withTitle: "Sucesso!", message: "As informações foram salvas")
            self.popToRoot()
        } else {
            self.navigationController.presentAlert(withTitle: "Tente novamente", message: "Esse endereço de email já está em uso.")
        }
    }
    
    func popToRoot() {
        self.navigationController.dismiss(animated: true, completion: nil)
        self.navigationController.popToRootViewController(animated: true)
    }
}
