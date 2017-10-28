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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let n = NotificationCenter.default
        let nameShow = NSNotification.Name.UIKeyboardWillShow
        let nameHide = NSNotification.Name.UIKeyboardWillHide
        n.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: nameShow, object: nil)
        n.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: nameHide, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let n = NotificationCenter.default
        n.removeObserver(self)
    }

    @objc func keyboardWillShow(notification: Notification?) {
        let rect = (notification?.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        UIView.animate(withDuration: 0.25, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
            self.view.transform = transform
        })
    }

    @objc func keyboardWillHide(notification: Notification?) {
        UIView.animate(withDuration: 0.25, animations: { () in
            self.view.transform = .identity
        })
    }

}

extension SignUpViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
