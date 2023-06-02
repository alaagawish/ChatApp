//
//  SignUpViewController.swift
//  ChatApp
//
//  Created by Alaa on 31/05/2023.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signup(_ sender: Any) {
        if (usernameTextField.text?.isEmpty == true) || passwordTextField.text?.count ?? 0 < 7 || (emailTextField.text?.isEmpty == true){
            
            let alert = UIAlertController(title: "SignUp Validation", message: "Password length must be 8 or more", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
          present(alert, animated: true,completion: nil)
        
        }else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){
               [weak self] (result, error) in
                guard error == nil else{
                    print(error)
                    return
                }
                print( self?.passwordTextField.text)
                
                guard let userId = result?.user.uid else{
                    return
                }
                let reference = Database.database().reference()
                let user = reference.child("users").child(userId)
                let dataArray: [String: Any] = ["username" : self?.usernameTextField.text ]
                
                user.setValue(dataArray)
                let signUpVC = self?.storyboard?.instantiateViewController(withIdentifier: "rooms") as! RoomsViewController
                self?.navigationController?.pushViewController(signUpVC, animated: true)
               
            }
        }
    }
    
   
}
