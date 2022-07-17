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
