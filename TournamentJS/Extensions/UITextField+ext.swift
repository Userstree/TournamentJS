//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

extension UITextField {
    func setTextColor(_ color: UIColor, font: UIFont) {

        textColor = color
        self.font = font
    }

    func setBottomBorder(with color: UIColor, width: CGFloat) {
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor

        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: width)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }

    func setPlaceHolderAttributes(placeHolderText : String, colour : UIColor , font : UIFont){
        attributedPlaceholder = NSAttributedString(string:placeHolderText, attributes:[NSAttributedString.Key.foregroundColor: colour , NSAttributedString.Key.font : font])
    }
}