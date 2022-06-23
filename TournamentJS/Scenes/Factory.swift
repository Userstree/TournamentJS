//
// Created by Dossymkhan Zhulamanov on 22.06.2022.
//

import UIKit

protocol FactoryProtocol {
    func make() -> UIViewController
}

final class Factory: FactoryProtocol {
    func make() -> UIViewController {
        let rootController = EntryPageViewController()
//        let viewModel = ViewModel()
        return rootController
    }
}
