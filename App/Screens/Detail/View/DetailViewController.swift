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
        label.text = "Especificações:"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
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
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Eu quero!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.isUserInteractionEnabled = true
        button.isEnabled = true
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
        view.addSubview(titleLabel)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            saveButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 70),
            saveButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -70),
            saveButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func applyExtraConfiguration() {
        view.backgroundColor = .systemBackground
    }
}
