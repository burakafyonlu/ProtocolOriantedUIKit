//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Burak Afyonlu on 11.05.2023.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    
    private var userViewModel : UserViewModel!
    private var userService : mockUserService!
    private var outPut : mockUserViewModelOutPut!

    override func setUpWithError() throws {
       userService = mockUserService()
        outPut = mockUserViewModelOutPut()
        userViewModel = UserViewModel(userService: userService)
        userViewModel.outPut = outPut
        
        
        
    }

    override func tearDownWithError() throws {
       
        userService = nil
        userViewModel = nil
    }

    func testUptadeView_whenAPISuccess_showsEmailNameUsername() throws {
       
        let mockUser = User(id: 1, name: "burak", username: "burakafyonlu", email: "burak@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        userViewModel.FetchUser()
        
        XCTAssertEqual(outPut.updateViewArray.first?.username, "burakafyonlu")
    }
    
    func testUptadeView_whenAPIFailure_showsNoUser() throws {
       
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.FetchUser()
        XCTAssertEqual(outPut.updateViewArray.first?.name, "No user Found")
        
    }

}

class mockUserService : userService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
}

class mockUserViewModelOutPut : outPut {
    var updateViewArray : [(name:String,email:String,username:String)] = []
    func updateView(name: String, email: String, username: String) {
        updateViewArray.append((name,email,username))
    }
    
    
    
    
}
