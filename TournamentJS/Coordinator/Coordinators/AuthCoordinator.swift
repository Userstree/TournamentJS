//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol AuthCoordinatorOutput: AnyObject {
    var finishFlow: callBack? { get set }
}

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

    var finishFlow: callBack?

    private let factory: AuthModuleFactory
    private let router: RouterProtocol
    private weak var signUpView: SignUpView?

    init(router: RouterProtocol, factory: AuthModuleFactory) {
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
        router.push(signUpView)
    }
}
