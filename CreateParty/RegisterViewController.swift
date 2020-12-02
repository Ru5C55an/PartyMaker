//
//  RegisterViewController.swift
//  CreateParty
//
//  Created by Руслан Садыков on 01.12.2020.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var savedName: String?
    var savedSurname: String?
    var savedEmail: String?
    var savedPassword: String?
    var savedBirthday = NSDate() as Date
    var savedGender: Int?
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var abortButton: UIButton!
    @IBOutlet weak var genderSegments: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var birthdayWheels: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.isEnabled = false
        registerButton.layer.cornerRadius = registerButton.frame.size.height / 2
        
        nameTextField.text = savedName
        surnameTextField.text = savedSurname
        emailTextField.text = savedEmail
        passwordTextField.text = savedPassword
        birthdayWheels.date = savedBirthday
        genderSegments.selectedSegmentIndex = savedGender ?? 0
        
        updateLoginButtonState()
    }

    
    @IBAction func textChanged(_ sender: UITextField) {
        updateLoginButtonState()
    }
    
    private func updateLoginButtonState() {
        let nameText = nameTextField.text ?? ""
        let surnameText = surnameTextField.text ?? ""
        let emailText = emailTextField.text ?? ""
        let passwordText = emailTextField.text ?? ""
    
        registerButton.isEnabled = !nameText.isEmpty && !surnameText.isEmpty && !emailText.isEmpty && !passwordText.isEmpty
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        
        if sender == abortButton {
            savedName = nameTextField.text ?? ""
            savedSurname = surnameTextField.text ?? ""
            savedEmail = emailTextField.text ?? ""
            savedPassword = passwordTextField.text ?? ""
            savedBirthday = birthdayWheels.date
            savedGender = genderSegments.selectedSegmentIndex
        }
        
        if sender == registerButton {
            performSegue(withIdentifier: "", sender: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
