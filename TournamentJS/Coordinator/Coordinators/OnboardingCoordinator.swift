//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

class OnboardingCoordinator: BaseCoordinator, CoordinatorFinishOutput {

    // MARK: - CoordinatorFinishOutput

    var finishFlow: (() -> Void)?

    // MARK: - Vars & Lets

    private let viewControllerFactory: ViewControllerFactory
    private let router: RouterProtocol

    // MARK: - Coordinator

    override func start() {
        showOnboarding()
    }

    // MARK: - Private Methods

    private func showOnboarding() {
        let onBoardingViewController = viewControllerFactory.instantiateOnboardingViewController()
        onBoardingViewController.onSkip = { [weak self] in
            self?.finishFlow?()
        }
        router.setRootModule(onBoardingViewController, hideBar: false)
    }

    // MARK: - Init

    init(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) {
        self.viewControllerFactory = viewControllerFactory
        self.router = router
        super.init()
    }
}
