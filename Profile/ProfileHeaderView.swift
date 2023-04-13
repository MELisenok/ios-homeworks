//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Лена on 3/25/23.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutProfileHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let imageElf: UIImageView = {
        let imageElf = UIImageView()
        imageElf.translatesAutoresizingMaskIntoConstraints = false
        imageElf.image = UIImage(named: "Elf.jpeg")
        imageElf.layer.cornerRadius = 55
        imageElf.layer.masksToBounds = true
        imageElf.layer.borderColor = UIColor.white.cgColor
        imageElf.layer.borderWidth = 3
        return imageElf
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Hi, my name is Elf!"
        nameLabel.textColor = UIColor.black
        nameLabel.font = .boldSystemFont(ofSize: 18.0)
        return nameLabel
    }()
    
    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Wating for something..."
        statusLabel.textColor = .gray
        statusLabel.font = .systemFont(ofSize: 14.0)
        return statusLabel
    }()
    
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
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
        statusLabel.text = statusText ?? " "
    }
    
    private lazy var statusTextFielld: UITextField = {
        let statusTextFielld = UITextField()
        statusTextFielld.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextFielld.frame.height))
        statusTextFielld.leftView = paddingView
        statusTextFielld.leftViewMode = .always
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
        statusText = statusTextFielld.text ?? " "
    }
    
    func layoutProfileHeaderView () {
        addSubview(imageElf)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusTextFielld)
        addSubview(setStatusButton)
        
        
        NSLayoutConstraint.activate([
            imageElf.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageElf.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageElf.widthAnchor.constraint(equalToConstant: 110),
            imageElf.heightAnchor.constraint(equalToConstant: 110),
            
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 142),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 60),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 22),
            
            statusTextFielld.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 25),
            statusTextFielld.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextFielld.heightAnchor.constraint(equalToConstant: 40),
            statusTextFielld.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            setStatusButton.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 70),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
