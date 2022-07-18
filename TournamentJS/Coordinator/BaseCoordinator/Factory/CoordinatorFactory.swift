//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol CoordinatorFactory {

    func makeAuthCoordinatorBox(router: RouterProtocol) -> Coordinator & AuthCoordinatorOutput
    func makeOnboardingCoordinator(router: RouterProtocol) -> Coordinator & OnboardingCoordinatorOutput
    func makeSettingsCoordinator() -> Coordinator
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator
}

protocol CoordinatorFactoryProtocol {
    func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactory, viewControllerFacory: )
}