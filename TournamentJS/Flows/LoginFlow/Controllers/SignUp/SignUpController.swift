//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

final class SignUpController: UIViewController, SignUpView {
    var onSignUpComplete: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SignUp"
        view.backgroundColor = .red
    }
}
