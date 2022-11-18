//
//  Coordinator.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    var childCoordinator: [Coordinator] { get set }
    func start()
}
