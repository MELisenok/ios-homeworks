//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Лена on 3/7/23.
//

import UIKit

protocol ProfileVCDelegate: AnyObject {
    func changeName(text: String)
}

final class ProfileViewController: UIViewController {
    
    let profileHeadView = ProfileHeaderView()
    
    private lazy var titleButton: UIButton = {
        let titleButton = UIButton()
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleButton.backgroundColor = .systemBlue
        titleButton.setTitle("Кнопка", for: .normal)
        titleButton.setTitleColor(.white, for: .normal)
        titleButton.layer.cornerRadius = 4.0
        titleButton.layer.shadowOffset.height = 4
        titleButton.layer.shadowOffset.width = 4
        titleButton.layer.shadowRadius = 4
        titleButton.layer.shadowColor = UIColor.black.cgColor
        titleButton.layer.shadowOpacity = 0.7
        
        return titleButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Профиль"
        view.addSubview(profileHeadView)
        view.addSubview(titleButton)
        profileHeadView.translatesAutoresizingMaskIntoConstraints = false
        layoutProfileViewController()
        profileHeadView.layoutProfileHeaderView()
    }
    
    
    private func layoutProfileViewController() {
        NSLayoutConstraint.activate([
            profileHeadView.topAnchor.constraint(equalTo: view.topAnchor),
            profileHeadView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeadView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeadView.heightAnchor.constraint(equalToConstant: 220),
            
            titleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            titleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            titleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
