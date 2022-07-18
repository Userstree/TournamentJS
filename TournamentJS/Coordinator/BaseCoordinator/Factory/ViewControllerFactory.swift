//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//


class ViewControllerFactory{
    func instantiateLoginViewController() -> LoginViewController {
        let loginViewController = LoginViewController()
        loginViewController.viewModel = LoginViewModelProtocol
        return loginViewController
    }

//    func instantiateOnboardingViewController() ->  {
//        let
//    }
}