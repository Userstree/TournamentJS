//
// Created by Dossymkhan Zhulamanov on 23.06.2022.
//

extension UIStackView {
    convenience init(viewElements: [UIView]) {
        self.init()
        axis = .vertical
        for element in viewElements {
            addArrangedSubview(element)
        }
    }
}

extension UIStackView {
    convenience init(elements: [ContentElement]) {
        self.init()
        elements.forEach { addArrangedSubview($0.view) }
    }
}


enum ContentElement {
    case imageView(UIImage)
    case imageLabel(String)
}

extension ContentElement {
    var view: UIView {
        switch self {
        case .imageView(let image):
            let imageView = UIImageView()
            imageView.image = image
            imageView.backgroundColor = .systemGray4
            imageView.contentMode = .scaleAspectFit
            return imageView
        case .imageLabel(let text):
            let label = UILabel()
            label.text = text
            label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            return label
        }
    }
}
