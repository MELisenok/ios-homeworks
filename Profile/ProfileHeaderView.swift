//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Лена on 3/25/23.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private var statusText: String?
        
    let imageElf: UIImageView = {
        let imageElf = UIImageView(frame: CGRect(x: 16, y: 104, width: 135, height: 135))
        imageElf.image = UIImage(named: "Elf.jpeg")
        imageElf.layer.cornerRadius = imageElf.frame.height/2
        imageElf.layer.masksToBounds = true
        imageElf.layer.borderColor = UIColor.white.cgColor
        imageElf.layer.borderWidth = 3
        return imageElf
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel(frame: CGRect(x: 170, y: 127, width: 207, height: 22))
        nameLabel.text = "Hi, my name is Elf!"
        nameLabel.textColor = UIColor.black
        nameLabel.font = .boldSystemFont(ofSize: 18.0)
        return nameLabel
    }()
    
    let statusLabel: UILabel = {
        let statusLabel = UILabel(frame: CGRect(x: 170, y: 198, width: 207, height: 22))
        statusLabel.text = "Wating for something..."
        statusLabel.textColor = .gray
        statusLabel.font = .systemFont(ofSize: 14.0)
        return statusLabel
    }()
    
    
    let setStatusButton: UIButton = {
        let setStatusButton = UIButton(frame: CGRect(x: 16, y: 285, width: 361, height: 50))
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.layer.cornerRadius = 4.0
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)
        return setStatusButton
    }()
    
    
    @objc func setStatusButtonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text!)
    }
    
    let statusTextFielld: UITextField = {
        let statusTextFielld = UITextField(frame: CGRect(x: 170, y: 230, width: 207, height: 40))
        statusTextFielld.backgroundColor = .white
        statusTextFielld.placeholder = "Future status..."
        statusTextFielld.font = .systemFont(ofSize: 15)
        statusTextFielld.textColor = .black
        statusTextFielld.layer.cornerRadius = 12.0
        statusTextFielld.layer.borderWidth = 1
        statusTextFielld.addTarget(self, action: #selector(statusTextFielldAction), for: .editingChanged)
        
        return statusTextFielld
    }()
    
        @objc func statusTextFielldAction(_ statusTextFielld: UITextField) {
            statusText = statusTextFielld.text
        }

    func setupView() {
        addSubview(imageElf)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextFielld)
    }
}
