//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

final class CoordinatorFactoryImp:
        CoordinatorFactory
{
    func makeSettingsCoordinator() -> Coordinator {
        makeSettingsCoordinator(navController: nil)
    }

    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator {
        makeSettingsCoordinator()
    }

    func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput {
        let coordinator = AuthCoordinator(router: router, factory: ModuleFactoryImp())
        return coordinator
    }

    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        OnboardingCoordinator(with: ModuleFactoryImp(), router: router)
    }

//    func makeSettingsCoordinator() -> Coordinator {
//        return makeSettingsCoordinator(navController: nil)
//    }
//
//    func makeSettingsCoordinator(navController: UINavigationController? = nil) -> Coordinator {
//        let coordinator = SettingsCoordinator(router: router(navController), factory: ModuleFactoryImp())
//        return coordinator
//    }

    private func router(_ navController: UINavigationController?) -> Router {
        RouterImp(rootController: navigationController(navController))
    }

    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return UINavigationController(nibName: nil, bundle: nil)
        }
    }
}
