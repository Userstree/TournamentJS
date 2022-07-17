//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol CoordinatorFactory {

    func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput
    func makeSettingsCoordinator() -> Coordinator
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator
}