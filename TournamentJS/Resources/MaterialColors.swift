//
// Created by Dossymkhan Zhulamanov on 17.07.2022.
//

enum MaterialColors {
    case background
    case onBackground

    var value: UIColor {
        switch self {
        case .background:
            return UIColor(red: 243 / 255, green: 242 / 255, blue: 242 / 255, alpha: 1)
        case .onBackground:
            return .black
        }
    }
}

struct ButtonGradientColors {
    static let leftColor = UIColor(red: 232 / 255, green: 72 / 255, blue: 96 / 255, alpha: 1)
    static let rightColor = UIColor(red: 231 / 255, green: 0, blue: 102 / 255, alpha: 1)
}

struct LeftToRightGradient {
    let layerGradient: CAGradientLayer
    init() {
        layerGradient = CAGradientLayer()
        layerGradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        layerGradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        layerGradient.colors = [ButtonGradientColors.leftColor, ButtonGradientColors.rightColor]
    }
}