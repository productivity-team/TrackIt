////
////  SignUpViewController.swift
////  habIt
////
////  Created by Maria Pecheritsyna on 01.04.2021.
////
//
//import UIKit
//import PinLayout
//import FirebaseAuth
//import Firebase
//
//class OldSignUpViewController: UIViewController {
//
//    private let regLable = UILabel()
//    private let emailField = UITextField()
//    private let nameField = UITextField()
//    private let passwordField = UITextField()
//    private let nameboxImage = UIImageView()
//    private let emailboxImage = UIImageView()
//    private let passwordboxImage = UIImageView()
//    private let signUpButton = UIButton()
//    private let logInButton = UIButton()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
//        view.addGestureRecognizer(tapGesture)
//
//        view.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
//
//        regLable.text = "Регистрация"
//        regLable.font = .systemFont(ofSize: 30)
//        regLable.font = UIFont(name: "Lato-Regular", size: 30)
//
//
//        nameField.placeholder = "Имя"
//        nameField.autocapitalizationType = .none
//        nameField.leftViewMode = .always
//        nameField.textColor = UIColor(red: 42/255, green: 43/255, blue: 43/255, alpha: 1)
//        nameField.font = UIFont(name: "Lato-Regular", size: 18)
//
//
//        emailField.placeholder = "Email"
//        emailField.autocapitalizationType = .none
//        emailField.leftViewMode = .always
//        emailField.textColor = UIColor(red: 42/255, green: 43/255, blue: 43/255, alpha: 1)
//        emailField.font = UIFont(name: "Lato-Regular", size: 18)
//
//
//        passwordField.placeholder = "Пароль"
//        passwordField.autocapitalizationType = .none
//        passwordField.leftViewMode = .always
//        passwordField.textColor = UIColor(red: 42/255, green: 43/255, blue: 43/255, alpha: 1)
//        passwordField.font = UIFont(name: "Lato-Regular", size: 18)
//        passwordField.isSecureTextEntry.toggle() //делает пароль невидимым
//
//
//        nameboxImage.image = UIImage(named: "TypingBox")
//        emailboxImage.image = UIImage(named: "TypingBox")
//        passwordboxImage.image = UIImage(named: "TypingBox")
//
//        signUpButton.layer.cornerRadius = 25
//        signUpButton.layer.masksToBounds = true
//        signUpButton.setTitle("Зарегистрироваться", for: .normal)
//        signUpButton.backgroundColor = UIColor(red: 134/255, green: 213/255, blue: 238/255, alpha: 1)
//        signUpButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
//        signUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
//        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
//
//        logInButton.layer.cornerRadius = 25
//        logInButton.layer.masksToBounds = true
//        logInButton.setTitle("Уже зарегистрированы?", for: .normal)
//        logInButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
//        logInButton.layer.borderWidth = 3
//        logInButton.layer.borderColor = CGColor(red: 77/255, green: 185/255, blue: 219/255, alpha: 1)
//        logInButton.backgroundColor = UIColor(red: 249/255, green: 255/255, blue: 255/255, alpha: 1)
//        logInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18)
//        logInButton.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
//
//
//        [regLable, nameboxImage, emailField, emailboxImage, passwordboxImage, nameField, passwordField, signUpButton, logInButton].forEach { view.addSubview($0) }
//    }
//
//
//    override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//        regLable.pin
//            .hCenter()
//            .bottom(541)
//            .sizeToFit()
//
//        nameField.pin
//            .hCenter()
//            .bottom(471)
//            .width(245)
//            .height(50)
//
//        emailField.pin
//            .hCenter()
//            .bottom(401)
//            .width(245)
//            .height(50)
//
//        passwordField.pin
//            .hCenter()
//            .bottom(331)
//            .width(245)
//            .height(50)
//
//        nameboxImage.pin
//            .width(280)
//            .height(50)
//            .hCenter()
//            .bottom(471)
//
//        emailboxImage.pin
//            .width(280)
//            .height(50)
//            .hCenter()
//            .bottom(401)
//
//        passwordboxImage.pin
//            .width(280)
//            .height(50)
//            .hCenter()
//            .bottom(331)
//
//        signUpButton.pin
//            .width(250)
//            .height(50)
//            .bottom(251)
//            .hCenter()
//
//        logInButton.pin
//            .bottom(138)
//            .hCenter()
//            .height(50)
//            .width(290)
//    }
//
//
//    func validateFields() -> String? {
//
//        //Chech that all fields are filled in
//        if nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
//            return "Пожалуйста заполните все поля"
//        }
//
//        return nil
//    }
//
//
//
//    // Функция регистрирует пользователя при нажатии на кнопку зарегистрироваться
//    // Выкидывает поп ап при ошибке
//    // При успешной регистрации сохраняет имя и uid пользователя в базу и переходит на главную
//    @objc
//    private func signUpButtonPressed() {
//
//        let er = validateFields()
//        guard er == nil else { return showAlert(message: "Ошибка при создании пользователя") }
//
//        //create clened versions of the data
//        let username = nameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//
//        //create the user
//            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//
//                if let err = error {
//                    self.showAlert(message: err.localizedDescription)
//                } else {
//
//                    //successfully created user, now store the user's name
//                    let db = Firestore.firestore()
//
//                    db.collection("users").addDocument(data: ["username":username, "uid":authResult!.user.uid]) { (error) in
//
//                        if error != nil {
//                            self.showAlert(message: "Не удалось сохранить данные пользователя")
//                        }
//                    }
//
//                    //Navigate to the home screen
//
//                    let homeVC = HomeViewController()
//                    homeVC.modalPresentationStyle = .fullScreen
//                    self.present(homeVC, animated: true, completion: nil)
//                }
//            }
//    }
//
//
//    //переход на экран входа при нажатии кнопки "Уже зарегистрированы?"
//    @objc func toLoginButtonPressed() {
//        let loginVC = OldLogInViewController()
//        loginVC.modalPresentationStyle = .fullScreen
//        present(loginVC, animated: true, completion: nil)
//    }
//
//
//
//    //показывает pop up window с ошибкой
//    func showAlert(message: String) {
//        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
//}
//
