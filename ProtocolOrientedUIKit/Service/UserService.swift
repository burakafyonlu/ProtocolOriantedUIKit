//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Burak Afyonlu on 11.05.2023.
//

import Foundation


protocol userService {
    
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void)
    
}
