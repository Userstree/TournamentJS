//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

protocol SignUpViewControllerProtocol {
    var onSignUp: (() -> Void)? { get set }
}

class SignUpViewController: UIViewController, SignUpViewControllerProtocol, UITextFieldDelegate {

    // MARK: - SignUpViewControllerProtocol

    var onSignUp: (() -> Void)?

    // MARK: - SignUpViewModelProtocol

    var viewModel: SignUpViewModelProtocol?

    // MARK: - Vars & Lets

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

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Name"
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

    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGN UP", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 22
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor(red: 231 / 255, green: 0, blue: 102 / 255, alpha: 1)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()

    private lazy var moveToSignInScreenButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        let font = UIFont.systemFont(ofSize: 18)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.black,
        ]
        var mutableString = NSMutableAttributedString(string: "Already have an account? ", attributes: attributes)
        let signUpFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
        let signUpAttributes: [NSAttributedString.Key: Any] = [
            .font: signUpFont,
            .foregroundColor: UIColor.black,
        ]
        let signUpAttributedString = NSAttributedString(string: "Sign in", attributes: signUpAttributes)
        mutableString.append(signUpAttributedString)
        button.setAttributedTitle(mutableString, for: .normal)
        return button
    }()

    // MARK: - Actions

    @objc private func signUpButtonTapped() {
        onSignUp?()
    }

    @objc private func signInButtonTapped() {

    }

    // MARK: - Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MaterialColors.background.value
        configureViews()
    }

    // MARK: - Configuring the Views
    private func configureViews() {
        [imageView,
         imageLabel,
         nameTextField,
         emailTextField,
         passwordTextField,
         signUpButton,
         moveToSignInScreenButton,
        ].forEach(view.addSubview)
        makeConstraints()
    }
    private func makeConstraints(){
        imageView.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.top.equalTo(view.snp.top).offset(180)
            $0.size.equalTo(CGSize(width: 96, height: 96))
        }
        imageLabel.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(4)
            $0.centerY.equalTo(imageView.snp.centerY)
        }
        nameTextField.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.width.equalTo(245)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(32)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.width.equalTo(245)
        }
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(32)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.width.equalTo(245)
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(32)
            $0.centerX.equalTo(view.snp.centerX)
        }
        moveToSignInScreenButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-46)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
}
