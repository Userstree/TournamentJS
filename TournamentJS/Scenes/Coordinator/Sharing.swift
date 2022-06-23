//
// Created by Dossymkhan Zhulamanov on 22.06.2022.
//

import Foundation
import UIKit

//protocol Sharing: AnyObject {
//    associatedtype SharedType
//    var sharedItems: [SharedType] { get }
//    var shareCoordinator: ShareCoordinator<SharedType>? { get set }
//    func didTapShareButton(_ sender: UIBarButtonItem)
//    func didShare()
//}
//
//extension Sharing where Self: Coordinating {
//    func didTapShareButton(_ sender: UIBarButtonItem) {
//        shareCoordinator = ShareCoordinator(root: root, sharedItems: sharedItems)
//        shareCoordinator?.barButtonItem = sender
//        shareCoordinator?.completionHandler = didShare
//        shareCoordinator?.start()
//    }
//
//    func didShare() {
//        shareCoordinator?.stop()
//        shareCoordinator = nil
//    }
//}