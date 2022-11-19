//
//  DetailViewController.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var coordinator: DetailCoordinator?
    
    var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configure()
    }
    
    private lazy var brandNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ford"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var modelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem Ipsum"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem Ipsum"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [brandNameLabel,
                                                       modelNameLabel, yearLabel,  ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        return stackView
    }()

    func configure() {
        self.brandNameLabel.text = viewModel?.car.marcaNome
        self.modelNameLabel.text = viewModel?.car.nomeModelo
    }
}

extension DetailViewController: Viewcode {
    
    func buildViewHierarchy() {
        view.addSubview(stackView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func applyExtraConfiguration() {
        view.backgroundColor = .systemBackground
    }
}
