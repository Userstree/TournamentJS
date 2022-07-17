//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

    var finishFlow: (() -> Void)?

    private let factory: AuthModuleFactory
    private let router: Router
    private weak var signUpView: SignUpView?

    init(router: Router, factory: AuthModuleFactory) {
        self.factory = factory
        self.router = router
    }

    override func start() {
        showLogin()
    }

    private func showLogin() {
        let loginOutput = factory.makeLoginOutput()
        loginOutput.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        loginOutput.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        router.setRootModule(loginOutput)
    }

    private func showSignUp() {
        signUpView = factory.makeSignUpHandler()
        signUpView?.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        router.push(signUpView, animated: true)
    }
}
