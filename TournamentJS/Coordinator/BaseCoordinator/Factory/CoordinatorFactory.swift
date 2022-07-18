//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//


protocol CoordinatorFactoryProtocol {
    func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> AuthCoordinator
    func makeOnboardingCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> OnboardingCoordinator
//    func makeMainCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactory, viewControllerFactory: ViewControllerFactory) ->
}

class CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> AuthCoordinator {
        AuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
    }

    func makeOnboardingCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> OnboardingCoordinator {
        OnboardingCoordinator(router: router, viewControllerFactory: viewControllerFactory)
    }
}