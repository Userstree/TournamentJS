//
// Created by Dossymkhan Zhulamanov on 19.07.2022.
//


class LogoView: UIView {

    // MARK: - Vars & Lets

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tournamentIcon")
        return imageView
    }()

    private lazy var imageTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Tournament"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()

    // MARK: - Controller lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        configureView()
    }

    // MARK: - Configuration of the View

    private func configureView(){
        [logoImageView,
         imageTextLabel,
        ].forEach(addSubview)
        makeConstraints()
    }
    private func makeConstraints(){
        logoImageView.snp.makeConstraints {
            $0.leading.equalTo(snp.leading)
            $0.top.equalTo(snp.top)
            $0.bottom.equalTo(snp.bottom)
        }
        imageTextLabel.snp.makeConstraints{
            $0.leading.equalTo(logoImageView.snp.trailing).offset(4)
            $0.centerY.equalTo(logoImageView.snp.centerY)
            $0.trailing.equalTo(snp.trailing)
        }
    }

    // MARK: - Init

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
