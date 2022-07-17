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