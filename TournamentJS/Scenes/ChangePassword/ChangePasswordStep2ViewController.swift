//
// Created by Dossymkhan Zhulamanov on 19.07.2022.
//


class ChangePasswordStep2ViewController: UIViewController {

    // MARK: - Vars & Lets

    private lazy var resetButton: UIButton = {
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

    @objc private func resetButtonTapped() {

    }

    // MARK: - Configuration of the View

    private func configureViews() {
        makeConstraints()
    }

    private func makeConstraints() {

    }

}
