//
//  ViewController.swift
//  ChatApp
//
//  Created by Alaa on 31/05/2023.
//

import UIKit
import Firebase
class SignInViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(_ sender: Any) {
        if  passwordTextField.text?.count ?? 0 < 8 || ((emailTxtField.text?.isEmpty) == true){
            
            let alert = UIAlertController(title: "Login Validation", message: "Write correct email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true,completion: nil)
        }else{
            guard let email = emailTxtField.text, let password = passwordTextField.text else{
                
                print("chech mail and password")
                return
            }
            Auth.auth().signIn(withEmail: email, password: password){
                [weak self](result, error) in
                if error == nil {
                    let alert = UIAlertController(title: "Login Validation", message: "chech mail and password", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self?.present(alert, animated: true,completion: nil)
                    print("chech mail and password")
                    print(result)
                }
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "signup") as! SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}

