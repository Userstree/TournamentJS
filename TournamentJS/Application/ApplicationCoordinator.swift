//
// Created by Dossymkhan Zhulamanov on 17.07.2022.
//

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let router: RouterProtocol
    private var lauchInstructor = LaunchInstructor.configure()

    private var instructor: LaunchInstructor {
        LaunchInstructor.configure()
    }

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

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
            switch instructor {
            case .onboarding: runOnboardingFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            }
        }
    }

    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinatorBox(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.lauchInstructor = LaunchInstructor.configure(tutorialWasShown: false, isAutorized: true)
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

    private func runOnboardingFlow() {
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.lauchInstructor = LaunchInstructor.configure(tutorialWasShown: true, isAutorized: true)
            self?.start()
            self?.removeDependency(coordinator)
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
}
