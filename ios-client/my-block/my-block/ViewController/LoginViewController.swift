//
//  LoginViewController.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    @IBAction func loginButtonTapped() {
        guard let userId = userIdTextField.text, let password = passwordTextField.text else { return }
        guard !userId.isEmpty && !password.isEmpty else { return }
        guard let id = Int(userId) else { return }
        UserDefaults.standard.set(id, forKey: "userId")
        performSegue()
        userIdTextField.text = nil
        passwordTextField.text = nil
    }

    func performSegue() {
        performSegue(withIdentifier: "login", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signup" {
            let vc = segue.destination as! SignUpViewController
            vc.onSignUp = performSegue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 6
    }

}
