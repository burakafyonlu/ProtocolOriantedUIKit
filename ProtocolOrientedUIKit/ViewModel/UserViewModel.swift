//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Burak Afyonlu on 11.05.2023.
//

import Foundation

class UserViewModel  {
    
    private let userService : userService
    
    weak var outPut : outPut?
    
    init(userService: userService) {
        self.userService = userService
       
    }
    
    func FetchUser() {
        
        userService.fetchUser { [weak self] result in
            
            switch result {
            case .success(let user) :
                
                self?.outPut?.updateView(name: user.name, email: user.email, username: user.username)
                
            case .failure(_) :
                self?.outPut?.updateView(name: "No user Found", email: "", username: "")
            }
            
        }
        
        
    }
    
    
}
