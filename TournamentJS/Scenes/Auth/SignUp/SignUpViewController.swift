//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

protocol SignUpViewControllerProtocol {
    var onSignUp: (() -> Void)? { get set }
}

class SignUpViewController: UIViewController, SignUpViewControllerProtocol {

}
