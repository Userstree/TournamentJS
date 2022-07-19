//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//


protocol CoordinatorFactoryProtocol {
    func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> AuthCoordinator
    func makeOnboardingCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> OnboardingCoordinator
    func makeForgetPasswordCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactory, viewControllerFactory: ViewControllerFactory) -> ChangePasswordCoordinator
}

class CoordinatorFactory: CoordinatorFactoryProtocol {

    func makeAuthCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> AuthCoordinator {
        return AuthCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
    }

    func makeOnboardingCoordinatorBox(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) -> OnboardingCoordinator {
        OnboardingCoordinator(router: router, viewControllerFactory: viewControllerFactory)
    }

    func makeForgetPasswordCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactory, viewControllerFactory: ViewControllerFactory) -> ChangePasswordCoordinator {
        ChangePasswordCoordinator(finishFlow: <#T##callBack?##TournamentJS.callBack?#>, router: <#T##RouterProtocol##TournamentJS.RouterProtocol#>, viewControllerFactory: <#T##ViewControllerFactory##TournamentJS.ViewControllerFactory#>)
    }

}