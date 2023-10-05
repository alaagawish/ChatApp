//
//  ViewController.swift
//  ChatApp
//
//  Created by Alaa on 31/05/2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextFIeld: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let reference = Database.database().reference()
        let rooms = reference.child("roomsTest")
    }

    @IBAction func signIn(_ sender: Any) {
        
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        
    }
}

