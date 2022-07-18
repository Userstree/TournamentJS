//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

fileprivate var onboardingWasShown = false
fileprivate var isAuthorized = false

enum LaunchInstructor {
    case main, auth, onboarding

    static func configure(
            tutorialWasShown: Bool = onboardingWasShown,
            isAutorized: Bool = isAuthorized
    ) -> LaunchInstructor {
        switch (tutorialWasShown, isAutorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
}