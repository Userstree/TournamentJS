//
// Created by Dossymkhan Zhulamanov on 23.06.2022.
//

import UIKit
import Lottie
import SnapKit

class OnboardCollectionViewCell: UICollectionViewCell {

    static let identifier = "OnboardCollectionViewCell"

    private lazy var animationContainer: UIView = {
        let view = UIView()
        return view
    }()
    private var animation = AnimationView()

    private var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        return label
    }()

    private var descriptionTextField: UITextView = {
        let textField = UITextView()
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.showsVerticalScrollIndicator = false
        return textField
    }()

    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView(viewElements: [animationContainer, title, descriptionTextField])
        return stack
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        configureViews()
    }

    func configure(dataSource: PageDataSource) {
        animation = AnimationView(name: dataSource.animationName)
        animation.animationSpeed = 1
        animation.play()

        animationContainer.addSubview(animation)

        title.text = dataSource.title
        descriptionTextField.text = dataSource.description
    }

    private func configureViews() {
        contentView.addSubview(mainVStack)
        makeConstraints()
    }

    private func makeConstraints() {
        mainVStack.snp.makeConstraints {
            $0.edges.equalTo(contentView.snp.edges)
        }
    }
}
