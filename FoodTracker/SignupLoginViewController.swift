//
//  SignupLoginViewController.swift
//  FoodTracker
//
//  Created by Ali Barış Öztekin on 2017-03-13.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class SignupLoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    struct UserCredentials{
        var username: String
        var password: String
        
        init?(username:String?, password:String? ) {
            guard let username = username, let password = password else {
                return nil
            }
            self.username = username
            self.password = password
            
        }
        var isValid: Bool {
            
            guard username.isEmpty == false && password.isEmpty == false && password.characters.count < 5  else {
                return false
            }
            return true
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    

    
    //MARK: Actions
    @IBAction func loginUser(_ sender: UIButton) {
        
        let credentials = UserCredentials(username: userNameTextField.text, password: passwordTextField.text)
        guard credentials?.isValid == false else {
            print("Invalid username/password /n Please try again")
            return
        }
        
        print("username \(credentials?.username), password\(credentials?.password)")
        //server save
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func signupUser(_ sender: UIButton) {
        
        let credentials = UserCredentials(username: userNameTextField.text, password: passwordTextField.text)
        guard credentials?.isValid == false else {
            print("Invalid username/password /n Please try again")
            return
        }
        
        print("username \(credentials?.username), password\(credentials?.password)")
        //server save
        NetworkManager.signupUserWithCredentials(username: credentials?.username, password: credentials?.password)
    
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
