//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Лена on 4/15/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let contentPostView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        //imageView.clipsToBounds = true
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
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let postLikes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let postViews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//метод будет срабатывать, когда ячейка будет переиспользована, в нём мы должны скинуть все наши настройки:
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        postAuthor.text = ""
        postDescription.text = ""
        postLikes.text = ""
        postViews.text = ""
    }
    
//метод будет вызыватьс из вне, сюда будет назначаться для ImageView картинка, для text текст
    func setupCell(post: Post) {
        let constantLikesText = "Likes: "
        let constantViewsText = "Views: "
        postImageView.image = post.image
        postAuthor.text = post.author
        postDescription.text = post.description
        postLikes.text = constantLikesText + String(post.likes)
        postViews.text = constantViewsText + String(post.views)
    }
    
    
    private func customizeCell() {
        contentPostView.backgroundColor = .white

    }
    
    private func layout() {
//        contentView.addSubview(contentWhiteView)
        [contentPostView, postImageView, postAuthor, postDescription, postLikes, postViews].forEach { contentView.addSubview($0) }
//        [contentWhiteView, carImageView, carText].forEach { contentView.addSubview($0) }
        
        //let heightView: CGFloat = 100
        let inset: CGFloat = 16
        //let imageInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            
            contentPostView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentPostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentPostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentPostView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            postAuthor.topAnchor.constraint(equalTo: contentPostView.topAnchor, constant: inset),
            postAuthor.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor),
            postAuthor.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor),
            
            postImageView.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentPostView.widthAnchor),
            
            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            postDescription.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: inset),
            postDescription.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -inset),
            
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: inset),
            postLikes.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: inset),
            postLikes.bottomAnchor.constraint(equalTo: contentPostView.bottomAnchor, constant: -inset),
            
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: inset),
            postViews.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -inset),
            postViews.bottomAnchor.constraint(equalTo: contentPostView.bottomAnchor, constant: -inset)
    
        ])
    }


}

