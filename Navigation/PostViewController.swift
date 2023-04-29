//
//  PostViewController.swift
//  Navigation
//
//  Created by Лена on 3/7/23.
//

import UIKit

class PostViewController: UIViewController {
    
    private let post: Post?
    private let insets: CGFloat = 16
    
    private let postImageView: UIImageView! = {
           let imageView = UIImageView()
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.backgroundColor = .black
           imageView.contentMode = .scaleAspectFit
           return imageView
       }()
    
    private let postAuthor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let postDescription: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .black
            label.numberOfLines = 0
            return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(postImageView)
        view.addSubview(postAuthor)
        view.addSubview(postDescription)
        
        NSLayoutConstraint.activate([
                    postImageView.topAnchor.constraint(equalTo: view.topAnchor),
                    postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                    postAuthor.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: insets),
                    postAuthor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets),
                    postAuthor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets),

                    postDescription.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: insets),
                    postDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets),
                    postDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets),
                ])

                title = post?.author
        makeBarItem()
    }
    
    init(post: Post? = nil) {
            self.post = post
            super.init(nibName: nil, bundle: nil)
        postAuthor.text = post?.author
               postDescription.text = post?.description
               postImageView.image = UIImage(named: post?.image ?? "")
           }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
    }
   
    @objc private func barItemAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
    
}
