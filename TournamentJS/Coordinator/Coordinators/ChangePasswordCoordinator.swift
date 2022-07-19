//
// Created by Dossymkhan Zhulamanov on 19.07.2022.
//

import Foundation

class ChangePasswordCoordinator: BaseCoordinator, CoordinatorFinishOutput {

    // MARK: - CoordinatorFinishOutput

    var finishFlow: callBack?

    // MARK: - Vars & Lets

    private let router: RouterProtocol
    private let viewControllerFactory: ViewControllerFactory

    // MARK: - Private methods

    private func showChangePasswordStep1() {
//        let changePasswordStep1VC = viewControllerFactory.
    }

    private func showChangePasswordStep2() {
//        let changePasswordStep1VC = viewControllerFactory.
    }

    // MARK: - Init

    init(router: RouterProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.viewControllerFactory = viewControllerFactory
        super.init()
    }

}
