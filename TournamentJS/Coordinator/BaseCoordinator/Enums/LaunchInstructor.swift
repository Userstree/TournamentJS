//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

fileprivate var onboardingWasShown = false
fileprivate var isAuthorized = false

enum LaunchInstructor {
//    case main
    case auth, onboarding

    static func configure(
            onboardingWasShown: Bool = onboardingWasShown,
            isAutorized: Bool = isAuthorized
    ) -> LaunchInstructor {
        switch (onboardingWasShown, isAutorized) {
        case (false, false): return .onboarding
        case (true, false): return .auth
//        case (true, true): return .main
        case (false, true), (true, true):
            return .onboarding
        }
    }
}