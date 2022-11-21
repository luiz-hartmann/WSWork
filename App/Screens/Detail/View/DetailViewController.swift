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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Informações do veículo"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private lazy var brandNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var modelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var fuelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var numberDoors: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Eu quero", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(saveButtonTap), for: .touchUpInside)
        return button
    }()
    
    @objc private func saveButtonTap() {
        self.coordinator?.presentRegisterView()
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
        stackView.spacing = 8
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
        view.addSubview(titleLabel)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 18),
            saveButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -18),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func applyExtraConfiguration() {
        view.backgroundColor = .secondarySystemBackground
    }
}
