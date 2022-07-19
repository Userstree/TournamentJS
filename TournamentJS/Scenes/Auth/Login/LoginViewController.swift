//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

typealias callBack = () -> Void

protocol LoginViewControllerProtocol {
    var onLogin: callBack? { get set }
    var onSignUp: callBack? { get set }
    var onChangePassword: callBack? { get set }
}

class LoginViewController: UIViewController, LoginViewControllerProtocol, UITextFieldDelegate {

    // MARK: - LoginViewControllerProtocol

    var onLogin: callBack?
    var onSignUp: callBack?
    var onChangePassword: callBack?

    // MARK: - ViewModelBased

    var viewModel: LoginViewModelProtocol?

    //MARK: - Vars & Lets

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tournamentIcon")
        return imageView
    }()

    private lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.text = "Tournament"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Email"
        textField.layer.cornerRadius = 8
        textField.layer.cornerCurve = .continuous
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 8
        textField.layer.cornerCurve = .continuous
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 22
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor(red: 231 / 255, green: 0, blue: 102 / 255, alpha: 1)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()

    private lazy var moveToSignUpScreenButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(doNotHaveAnAccountButtonTapped), for: .touchUpInside)
        let font = UIFont.systemFont(ofSize: 18)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.black,
        ]
        var mutableString = NSMutableAttributedString(string: "Don't have an account? ", attributes: attributes)
        let signUpFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
        let signUpAttributes: [NSAttributedString.Key: Any] = [
            .font: signUpFont,
            .foregroundColor: UIColor.systemBlue,
        ]
        let signUpAttributedString = NSAttributedString(string: "Sign up", attributes: signUpAttributes)
        mutableString.append(signUpAttributedString)
        button.setAttributedTitle(mutableString, for: .normal)
        return button
    }()

    private lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        let font = UIFont.systemFont(ofSize: 14)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.systemBlue,
        ]
        var mutableString = NSAttributedString(string: "Forgot Password?", attributes: attributes)
        button.setAttributedTitle(mutableString, for: .normal)
        return button
    }()

    // MARK: - Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MaterialColors.background.value
        configureViews()
    }

    // MARK: - Actions

    @objc private func loginButtonTapped() {
        onLogin?()
    }

    @objc private func doNotHaveAnAccountButtonTapped() {
        onSignUp?()
    }

    @objc private func forgotPasswordButtonTapped() {
        onChangePassword?()
    }

    // MARK: - Configuration of the View

    private func configureViews(){
        [imageView,
         imageLabel,
         emailTextField,
         passwordTextField,
         loginButton,
         moveToSignUpScreenButton,
         forgetPasswordButton,
        ].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints(){
        imageView.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.top.equalTo(view.snp.top).offset(200)
            $0.size.equalTo(CGSize(width: 96, height: 96))
        }
        imageLabel.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(4)
            $0.centerY.equalTo(imageView.snp.centerY)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(32)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.width.equalTo(246)
        }
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(32)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.width.equalTo(246)
        }
        forgetPasswordButton.snp.makeConstraints{
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgetPasswordButton.snp.bottom).offset(16)
            $0.centerX.equalTo(view.snp.centerX)
        }
        moveToSignUpScreenButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-46)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }

    // MARK: - Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
