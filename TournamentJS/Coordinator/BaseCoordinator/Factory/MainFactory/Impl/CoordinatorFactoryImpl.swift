//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

//final class CoordinatorFactoryImp:
//        CoordinatorFactory
//{
//    func makeSettingsCoordinator() -> Coordinator {
//        makeSettingsCoordinator(navController: nil)
//    }
//
//    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator {
//        makeSettingsCoordinator()
//    }
//
//    func makeAuthCoordinatorBox(router: RouterProtocol) -> Coordinator & AuthCoordinatorOutput {
//        let coordinator = AuthCoordinator(router: router, factory: ModuleFactoryImp())
//        return coordinator
//    }
//
//    func makeOnboardingCoordinator(router: RouterProtocol) -> Coordinator & OnboardingCoordinatorOutput {
//        OnboardingCoordinator(with: ModuleFactoryImp(), router: router)
//    }
//
//    private func router(_ navController: UINavigationController?) -> RouterProtocol {
//        Router(rootController: navigationController(navController))
//    }
//
//    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
//        if let navController = navController {
//            return navController
//        } else {
//            return UINavigationController(nibName: nil, bundle: nil)
//        }
//    }
//}
