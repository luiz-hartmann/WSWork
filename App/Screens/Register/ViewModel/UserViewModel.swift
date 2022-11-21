//
//  RegisterViewModel.swift
//  App
//
//  Created by Luiz Hartmann on 20/11/22.
//

import Foundation

class UserViewModel {
    var user: User?
    
    init(user: User) {
        self.user = user
    }
    
    var id: Int {
        return self.user?.id ?? 0
    }
    
    var username: String {
        return self.user?.name ?? String.empty
    }
    
    var email: String {
        return self.user?.email ?? String.empty
    }
    
    var password: String {
        return self.user?.password ?? String.empty
    }
}
