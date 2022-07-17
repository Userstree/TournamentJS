//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

final class SignUpController: UIViewController, SignUpView {
    var confirmed: Bool = false
//    {
//        didSet {
//
//        }
//    }

    func conformTermsAgreement(_ agree: Bool) {
        
    }

    var onSignUpComplete: (() -> Void)?
    var onTermsButtonTap: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SignUp"
    }
}
