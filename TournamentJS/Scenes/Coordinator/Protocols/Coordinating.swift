//
// Created by Dossymkhan Zhulamanov on 22.06.2022.
//

import UIKit
import Foundation

protocol Coordinating: AnyObject {
    associatedtype ViewController: UIViewController
    var viewController: ViewController? { get set }
    var root: UIViewController { get }
    func createViewController() -> ViewController
    func configure(vc: ViewController)
    func show(vc: ViewController)
    func dismiss()
}

extension Coordinating {
    func configure(vc: ViewController) {
    }
    func show(vc: ViewController) {
        root.show(vc, sender: self)
    }
    func dismiss() {
        root.dismiss(animated: true, completion: nil)
    }
}

extension Coordinating {
    func start() {
        let vc = createViewController()
        configure(vc: vc)
        show(vc: vc)
        viewController = vc
    }

    func stop() {
        dismiss()
        self.viewController = nil
    }
}
