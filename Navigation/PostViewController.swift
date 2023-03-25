//
//  PostViewController.swift
//  Navigation
//
//  Created by Лена on 3/7/23.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        makeBarItem()
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
