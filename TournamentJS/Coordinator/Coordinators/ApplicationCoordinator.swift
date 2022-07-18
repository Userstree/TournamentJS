//
// Created by Dossymkhan Zhulamanov on 17.07.2022.
//

final class ApplicationCoordinator: BaseCoordinator {

    // MARK: - Vars & Lets

    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    private var launchInstructor = LaunchInstructor.configure()
    private let viewControllerFactory: ViewControllerFactory = ViewControllerFactory()

    // MARK: - Coordinator

    override func start(with option: DeepLinkOption?) {
        if let option = option {
            switch option {
            case .onboarding: runOnboardingFlow()
            case .signUp: runAuthFlow()
            default: childCoordinators.forEach { coordinator in
                coordinator.start(with: option)
            }
            }
        } else {
            switch launchInstructor {
            case .auth: runAuthFlow()
            case .onboarding: runOnboardingFlow()
//            case .main: runMainFlow()
            }
        }
    }

    // MARK: - Private Methods

    private func runAuthFlow() {
        print("in auth")
        let coordinator = coordinatorFactory.makeAuthCoordinatorBox(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(onboardingWasShown: true, isAutorized: true)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }

    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeOnboardingCoordinatorBox(router: router, viewControllerFactory: viewControllerFactory)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(onboardingWasShown: true, isAutorized: false)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }

    private func runMainFlow() {
//        let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
//        addDependency(coordinator)
//        router.setRootModule(module, hideBar: true)
//        coordinator.start()
    }

    // MARK: - Init

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
}
