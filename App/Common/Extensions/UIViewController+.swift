//
//  UIViewController+.swift
//  App
//
//  Created by Luiz Hartmann on 19/11/22.
//

import UIKit

extension UIView {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}


extension UIViewController {
    func presentAlert(withTitle title: String, message : String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
