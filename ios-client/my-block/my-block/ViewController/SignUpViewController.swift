//
//  SignUpViewController.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/29.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var onSignUp: (() -> ())?

    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!

    @IBAction func signUpButtonTapped() {
        guard let userId = userIdTextField.text, let password = passwordTextField.text else { return }
        guard !userId.isEmpty && !password.isEmpty else { return }
        guard let id = Int(userId) else { return }
        UserDefaults.standard.set(id, forKey: "userId")
        dismiss(animated: true, completion: onSignUp)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 6
    }

}

extension SignUpViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
