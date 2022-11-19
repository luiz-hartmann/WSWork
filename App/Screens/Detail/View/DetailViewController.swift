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
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var modelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var fuelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var numberDoors: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Eu quero!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(saveButtonTap), for: .touchUpInside)
        return button
    }()
    
     @objc private func saveButtonTap() {
        self.coordinator?.onSave()
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [brandNameLabel,
                                                       modelNameLabel,
                                                       yearLabel,
                                                       fuelLabel,
                                                       numberDoors])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .secondarySystemBackground
        return stackView
    }()
    
    func configure() {
        self.brandNameLabel.text = viewModel?.marcaNome.capitalized
        self.modelNameLabel.text = viewModel?.nomeModelo.capitalized
        self.yearLabel.text = viewModel?.ano
        self.fuelLabel.text = viewModel?.combustivel.capitalized
        self.numberDoors.text = viewModel?.numPortas
    }
}

extension DetailViewController: Viewcode {
    
    func buildViewHierarchy() {
        view.addSubview(stackView)
        view.addSubview(saveButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 18),
            saveButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 70),
            saveButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -70),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func applyExtraConfiguration() {
        view.backgroundColor = .systemBackground
    }
}
