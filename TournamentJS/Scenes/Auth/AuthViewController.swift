//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

class AuthViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Vars & Lets

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tournamentIcon")
        return imageView
    }()

    lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.text = "Tournament"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()

    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Email"
        textField.layer.cornerRadius = 8
        textField.layer.cornerCurve = .continuous
        return textField
    }()

    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 8
        textField.layer.cornerCurve = .continuous
        return textField
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 22
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor(red: 231 / 255, green: 0, blue: 102 / 255, alpha: 1)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
        button.clipsToBounds = true
        return button
    }()

    lazy var moveToSignUpScreenButton: UIButton = {
        let button = UIButton()
        let font = UIFont.systemFont(ofSize: 18)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.black,
        ]
        var mutableString = NSMutableAttributedString(string: "Don't have an account? ", attributes: attributes)
        let signUpFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
        let signUpAttributes: [NSAttributedString.Key: Any] = [
            .font: signUpFont,
            .foregroundColor: UIColor.black,
        ]
        let signUpAttributedString = NSAttributedString(string: "Sign up", attributes: signUpAttributes)
        mutableString.append(signUpAttributedString)
        button.setAttributedTitle(mutableString, for: .normal)
        return button
    }()

    // MARK: - Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}