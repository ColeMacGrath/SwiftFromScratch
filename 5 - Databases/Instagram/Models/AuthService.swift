//
//  AuthService.swift
//  Instagram
//
//  Created by Moisés Córdova on 07/11/19.
//  Copyright © 2019 Moisés Córdova. All rights reserved.
//

import Foundation
import FirebaseAuth

//Completion Async
typealias Completion = (_ errorMessage: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _shared = AuthService()
    
    //Se retorna una instancia del objeto para obtener todas sus propiedades
    static var shared: AuthService {
        return self._shared
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        //Se llama a sigIn de Firebase
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = (error as NSError?) {
                //Error al hacer login
                self.handleFirebaseError(error: error, onComplete: onComplete)
            } else {
                if error == nil {
                    //No existe error, la autenticación fue exitosa
                    onComplete?(nil, user?.user)
                }
            }
        }
    }
    
    func register(email: String, password: String, onComplete: Completion?) {
        //Se llama al createUser de Firebase
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = (error as NSError?) {
                //Error al crear usuario
                self.handleFirebaseError(error: error, onComplete: onComplete)
            } else {
                if result?.user.uid != nil {
                    //hacer login
                    self.login(email: email, password: password) { (message, data) in
                        onComplete?(nil, result?.user)
                    }
                }
            }
        }
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        if let error = AuthErrorCode(rawValue: error.code) {
            switch error {
            case .wrongPassword:
                onComplete?("Wrong password", nil)
            case .invalidEmail, .invalidCredential:
                onComplete?("Invalid email", nil)
            case .emailAlreadyInUse:
                onComplete?("Email Already in use", nil)
            case .userNotFound:
                onComplete?("User not found", nil)
            case .weakPassword:
                onComplete?("Weak password", nil)
            case .networkError:
                onComplete?("Network Error", nil)
            case .userDisabled:
                onComplete?("Ban", nil)
            default:
                break
            }
        }
    }
    
}
