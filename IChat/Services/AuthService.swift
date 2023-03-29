//
//  AuthService.swift
//  IChat
//
//  Created by Александр on 29.03.2023.
//  Copyright © 2023 Алексей Пархоменко. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

final class AuthService {

    static let shared = AuthService()
    private let auth = Auth.auth()


    func login(email: String?, password: String?, complition: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                complition(.failure(error!))
                return
            }
            complition(.success(result.user))
        }
    }

    func register(email: String?, password: String?, confirmPassword: String?, complition: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                complition(.failure(error!))
                return
            }

            complition(.success(result.user))
        }

    }


}
