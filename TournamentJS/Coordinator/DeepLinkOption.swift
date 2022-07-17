//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

struct DeepLinkURLConstants {
    static let Onboarding = "onboarding"
    static let Settings = "settings"
    static let Login = "login"
    static let SignUp = "signUp"
    static let profile = "profile"
    static let community = "community"
}

enum DeepLinkOption {
    case profile
    case community
    case onboarding
    case settings
    case login
    case signUp

    static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
           let url = userActivity.webpageURL,
           let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            //TODO: extract string and match with DeepLinkURLConstants
        }
        return nil
    }

    static func build(with dict: [String : Any]?) -> DeepLinkOption? {
        guard let id = dict?["launch_id"] as? String else { return nil }

        switch id {
        case DeepLinkURLConstants.Onboarding: return .onboarding
        case DeepLinkURLConstants.Settings: return .settings
        case DeepLinkURLConstants.Login: return .login
        case DeepLinkURLConstants.SignUp: return .signUp
        default: return nil
        }
    }
}
