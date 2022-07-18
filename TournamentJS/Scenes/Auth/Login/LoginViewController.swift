//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

protocol LoginViewControllerProtocol {
    var onLogin: (() -> Void)? { get set }
    var onSignUp: (() -> Void)? { get set }
    var onChangePassword: (() -> Void)? { get set }
}

class LoginViewController: UIViewController, LoginViewControllerProtocol {

}
