//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//


class ViewControllerFactory{
    func instantiateLoginViewController() -> LoginViewController {
        let loginViewController = LoginViewController()
        loginViewController.viewModel = LoginViewModel()
        return loginViewController
    }

    func instantiateOnboardingViewController() -> OnboardingViewController {
        let onboardingViewController = OnboardingViewController()
        onboardingViewController.viewModel = OnboardingViewModel()
        return onboardingViewController
    }

    func instantiateSignUpViewController() -> SignUpViewController {
        let signUpViewController = SignUpViewController()
        signUpViewController.viewModel = SignUpViewModel()
        return signUpViewController
    }
}