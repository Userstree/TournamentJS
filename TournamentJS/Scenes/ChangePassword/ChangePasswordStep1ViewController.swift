//
// Created by Dossymkhan Zhulamanov on 19.07.2022.
//

class ChangePasswordStep1ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Vars & Lets

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Email"
        return textField
    }()

    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 22
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor(red: 231 / 255, green: 0, blue: 102 / 255, alpha: 1)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()

    // MARK: - Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @objc private func submitButtonTapped() {

    }

    // MARK: - Configuration of the View

    private func configureViews() {
        [emailTextField,
         submitButton,
        ].forEach(view.addSubview)
        makeConstraints()
    }
    private func makeConstraints() {
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(100)
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.width.equalTo(246)
        }
        submitButton.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(24)
            $0.centerX.equalTo(emailTextField.snp.centerX)
        }
    }
    
}