//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

final class LoginController: UIViewController, LoginView {

    var onCompleteAuth: (() -> Void)?
    var onSignUpButtonTap: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
}
