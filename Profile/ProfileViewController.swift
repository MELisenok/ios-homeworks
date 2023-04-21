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

final class ProfileViewController: UIViewController, PhotosTableDelegate {
    
    private let post: [Post] = Post.makePost()
    private let photosTableVC = PhotosTableViewController()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self //означает, что этот вьюКонтроллер будет ответственнен за dataSource(за наполнение таблицы информацией)
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier) //регистрируем ячейку, см.UIView+Extension
        return tableView
    }()
    
    func galleryButtonPressed() {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        photosTableVC.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: false)
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
            if section == 0 {
                return 0
            }
            return post.count //ячеек столько, сколько элементов в массиве
        }
    
    //в этом методе проиходит конфигурация ячейки:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //можно использовать форсАнрап, тк класс PostTableViewCell существует => это безопасно:
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(post: post[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           2
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            header.layoutProfileHeaderView()
            return header
        }
        if section == 1 {
            return photosTableVC.view
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        }
        if section == 1 {
            return 160
        }
        return 0
    }
}
