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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Профиль"
        view.addSubview(profileHeadView)
        profileHeadView.setupView()
        }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeadView.frame = view.frame
    }
}
