//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

final class ModuleFactoryImp:
        AuthModuleFactory,
        OnboardingModuleFactory
{

    func makeLoginOutput() -> LoginView {
        LoginController()
    }

    func makeSignUpHandler() -> SignUpView {
        SignUpController()
    }

    func makeOnboardingModule() -> OnboardingView {
        OnboardingController()
    }
}
