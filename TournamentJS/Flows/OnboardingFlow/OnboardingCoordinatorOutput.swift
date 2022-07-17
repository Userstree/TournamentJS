//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol OnboardingCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}
