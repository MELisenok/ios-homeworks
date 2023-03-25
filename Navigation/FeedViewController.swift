//
//  FeedViewController.swift
//  Navigation
//
//  Created by Лена on 3/6/23.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Просмотреть пост", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.title = "Лента"
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(postButton)
        postButton.center = view.center
        postButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.title = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    var post = Post(title: "Привет!")
}

   
