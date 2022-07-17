//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

final class LoginController: UIViewController, LoginView {

    var onCompleteAuth: (() -> Void)?
    var onSignUpButtonTap: (() -> Void)?

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
//        textField.
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MaterialColors.background.value
        title = "Login"
        configureViews()
    }

    private func configureViews(){
        [imageView,imageLabel].forEach(view.addSubview)
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
    }
}

//enum ContentElement {
//    case imageView(UIImage)
//    case imageLabel(String)
//}
//
//extension ContentElement {
//    var view: UIView {
//        switch self {
//        case .imageView(let image):
//            let imageView = UIImageView()
//            imageView.image = image
//            imageView.backgroundColor = .systemGray4
//            imageView.contentMode = .scaleAspectFit
//            return imageView
//        case .imageLabel(let text):
//            let label = UILabel()
//            label.text = text
//            label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
//            return label
//        }
//    }
//}
