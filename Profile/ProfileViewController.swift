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
    
    private let post: [Post] = Post.makePost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self //означает, что этот вьюКонтроллер будет ответственнен за dataSource(за наполнение таблицы информацией)
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier) //регистрируем ячейку, см.UIView+Extension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        layoutProfileVC()
    }
    
    private func layoutProfileVC() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    //какое кол-во элементов будет в одной секции:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        post.count //ячеек столько, сколько элементов в массиве
    }
    
    //в этом методе проиходит конфигурация ячейки:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //можно использовать форсАнрап, тк класс PostTableViewCell существует => это безопасно:
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(post: post[indexPath.row])
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        header.layoutProfileHeaderView()
        return header
      
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        220
    }
}
