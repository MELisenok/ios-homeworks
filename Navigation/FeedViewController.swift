//
//  FeedViewController.swift
//  Navigation
//
//  Created by Лена on 3/6/23.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray2
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var buttonOne: UIButton = {
        let buttonOne = UIButton()
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.backgroundColor = .systemBlue
        buttonOne.setTitle("Кнопка 1", for: .normal)
        buttonOne.setTitleColor(.white, for: .normal)
        buttonOne.layer.cornerRadius = 4.0
        buttonOne.layer.shadowOffset.height = 4
        buttonOne.layer.shadowOffset.width = 4
        buttonOne.layer.shadowRadius = 4
        buttonOne.layer.shadowColor = UIColor.black.cgColor
        buttonOne.layer.shadowOpacity = 0.7
        buttonOne.addTarget(self, action: #selector(setupButton), for: .touchUpInside)
        return buttonOne
    }()
    
    @objc func setupButton() {
        buttonOne.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
    }
    
    private lazy var buttonTwo: UIButton = {
        let buttonTwo = UIButton()
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.backgroundColor = .systemBlue
        buttonTwo.setTitle("Кнопка 2", for: .normal)
        buttonTwo.setTitleColor(.white, for: .normal)
        buttonTwo.layer.cornerRadius = 4.0
        buttonTwo.layer.shadowOffset.height = 4
        buttonTwo.layer.shadowOffset.width = 4
        buttonTwo.layer.shadowRadius = 4
        buttonTwo.layer.shadowColor = UIColor.black.cgColor
        buttonTwo.layer.shadowOpacity = 0.7
        
        return buttonTwo
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.title = "Лента"
        layoutFeedViewController()
        setupButton()
    }
    
    private func layoutFeedViewController() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 213),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 250),
        
        ])
    }
    
    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.title = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    var post = Post(title: "Привет!")
}

   
