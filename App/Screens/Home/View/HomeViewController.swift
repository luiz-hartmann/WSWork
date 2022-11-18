//
//  HomeViewController.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeViewController: Viewcode {
    
    func buildViewHierarchy() { }
    
    func addConstraints() { }
    
    func applyExtraConfiguration() {
        view.backgroundColor = .systemBackground
    }
}

