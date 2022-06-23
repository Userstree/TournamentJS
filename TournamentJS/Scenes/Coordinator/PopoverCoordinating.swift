//
// Created by Dossymkhan Zhulamanov on 22.06.2022.
//

import UIKit
import Foundation

protocol PopoverCoordinating: Coordinating {
    var barButtonItem: UIBarButtonItem? { get set }
}

extension PopoverCoordinating {
    func show(vc: ViewController) {
        vc.popoverPresentationController?.barButtonItem = barButtonItem
        root.present(vc, animated: true, completion: nil)
    }
}
