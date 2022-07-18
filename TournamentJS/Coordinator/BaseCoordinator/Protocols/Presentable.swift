//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        self
    }
}
