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