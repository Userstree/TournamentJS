//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

final class AuthCoordinator: BaseCoordinator, CoordinatorFinishOutput {

    // MARK: - CoordinatorFinishOutput

    var finishFlow: callBack?

    // MARK: - Vars & Lets

    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    private let viewControllerFactory: ViewControllerFactory

    // MARK: - Coordinator

    override func start() {
        showLoginViewController()
    }

    // MARK: - Private Methods

    private func showLoginViewController() {
        let loginViewController = viewControllerFactory.instantiateLoginViewController()
        loginViewController.onLogin = { [weak self] in
            self?.finishFlow?()
        }
        loginViewController.onSignUp = { [weak self] in
            self?.showSignUpViewController()
        }
        router.setRootModule(loginViewController, hideBar: true)
    }

    private func showSignUpViewController() {
        let signUpViewController = viewControllerFactory.instantiateSignUpViewController()
        signUpViewController.onSignUp = { [weak self] in
            self?.finishFlow?()
        }
        router.push(signUpViewController)
    }

    // MARK: - Init

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.viewControllerFactory = viewControllerFactory
        super.init()
    }
}
