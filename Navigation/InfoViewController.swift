//
//  InfoViewController.swift
//  Navigation
//
//  Created by Лена on 3/15/23.
//

import UIKit

class InfoViewController: UIViewController {

    private let messageButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Назад", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupButton()
    }
    
    private func setupButton(){
        view.addSubview(messageButton)
        messageButton.center = view.center
        messageButton.addTarget(self, action: #selector(messageAction), for: .touchUpInside)
    }
    
    @objc private func messageAction() {
        let alert = UIAlertController(title: "Внимание!", message: "Вы точно хотите вернуться назад?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            self.dismiss(animated: true) // тк был present, то использую dismiss для возврата назад
            print("Message1")
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
 
}
