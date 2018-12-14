//
//  LoginViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusMesageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: Actions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        print("Pressed login button")
        
        // HINT:  The name of the segue that goes to the next screen is: segueLoginSignup
        // You can check the name by going to Main.storyboard > clicking on segue > looking at Attributes Inspector
        
        
        // UI: Get the email/password from the text boxes
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // MARK: FB:  Try to sign the user in using Firebase Authentication
        // This is all boilerplate code copied and pasted from Firebase documentation
        Auth.auth().signIn(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. Found a user!
                print("User signed in! ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                
                // 2. So send them to screen 2!
                self.performSegue(withIdentifier: "segueLoginSignup", sender: nil)
            }
            else {
                // 1. A problem occured when looking up  the user
                // - doesn't meet password requirements
                // - user already exists
                print("ERROR!")
                print(error?.localizedDescription)
                
                // 2. Show the error in user interface
                self.statusMesageLabel.text = error?.localizedDescription
            }
        }
    }
    
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        print("pressed signup button")

        // HINT:  The name of the segue that goes to the next screen is: segueLoginSignup
        // You can check the name by going to Main.storyboard > clicking on segue > looking at Attributes Inspector
        // UI: Get the email/password from the text boxes
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // MARK: FB:  Try to create a user using Firebase Authentication
        // This is all boilerplate code copied and pasted from Firebase documentation
        Auth.auth().createUser(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. New user created!
                print("Created user: ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                
                //2. @TODO: You decide what you want to do next!
                // - do you want to send them to the next page?
                // - maybe ask them to fill in other forms?
                // - show a tutorial?
                self.statusMesageLabel.text = "user \(email) has been created"
            }
            else {
                // 1. Error when creating a user
                print("ERROR!")
                print(error?.localizedDescription)
                
                // 2. Show the error in the UI
                self.statusMesageLabel.text = error?.localizedDescription
                
            }
        }
        
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
