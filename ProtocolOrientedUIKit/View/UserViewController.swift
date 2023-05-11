//
//  ViewController.swift
//  ProtocolOrientedUIKit
//
//  Created by Burak Afyonlu on 11.05.2023.
//

import UIKit

class UserViewController: UIViewController , outPut {
    
    
    func updateView(name: String, email: String, username: String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.usernameLabel.text = username
    }
    
    
    private let viewModel : UserViewModel

    private let nameLabel : UILabel = {
       
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let usernameLabel : UILabel = {
       
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let emailLabel : UILabel = {
       
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.outPut = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        //fetchUsers()
        viewModel.FetchUser()
    }

    private func setUpViews() {
        
        view.backgroundColor = .systemYellow
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate(
            
            [
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nameLabel.heightAnchor.constraint(equalToConstant: 60),
                nameLabel.widthAnchor.constraint(equalToConstant: 200),
                nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                
                emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emailLabel.heightAnchor.constraint(equalToConstant: 60),
                emailLabel.widthAnchor.constraint(equalToConstant: 200),
                emailLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 100),
            
                usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                usernameLabel.heightAnchor.constraint(equalToConstant: 60),
                usernameLabel.widthAnchor.constraint(equalToConstant: 200),
                usernameLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor, constant: 100)
            ]
        )
        nameLabel.text = "Name Label"
        emailLabel.text = "Email Label"
        usernameLabel.text = "Username Label"
    }
    
    /*private func fetchUsers() {
        
        APIManager.shared.fetchUser { result in
            
            switch result {
            case .success(let user) :
                self.usernameLabel.text = user.username
                self.nameLabel.text = user.name
                self.emailLabel.text = user.email
                
            case .failure :
                
                self.nameLabel.text = "No User Found"
                
            }
        }
    }*/
}

