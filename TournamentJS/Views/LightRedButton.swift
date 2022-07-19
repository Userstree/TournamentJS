//
// Created by Dossymkhan Zhulamanov on 19.07.2022.
//


class LightRedButton: UIButton {

    convenience init(title: String, cornerRadius: Int? = 22, borderWidth: Int? = 0.7) {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        layer.cornerRadius = cornerRadius
        layer.cornerCurve = .continuous
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = UIColor(red: 231 / 255, green: 0, blue: 102 / 255, alpha: 1)
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 28, bottom: 10, right: 28)
        clipsToBounds = true
        return button
    }

}
