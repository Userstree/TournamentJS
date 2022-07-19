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
        loginViewController.onLogin = { [unowned self] in
            self.finishFlow?()
        }
        loginViewController.onSignUp = { [unowned self] in
            self.showSignUpViewController()
        }
        router.setRootModule(loginViewController, hideBar: false)
    }

    private func showSignUpViewController() {
        let signUpViewController = viewControllerFactory.instantiateSignUpViewController()
        signUpViewController.onSignUp = { [unowned self] in
            self.finishFlow?()
        }
        router.push(signUpViewController)
    }

    private func showForgetPassword(module: LoginViewController) {
//        let coordiantor = coordinatorFactory

    }

    // MARK: - Init

    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.viewControllerFactory = viewControllerFactory
        super.init()
    }

}
