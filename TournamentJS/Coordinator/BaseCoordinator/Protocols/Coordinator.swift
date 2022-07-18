//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol Coordinator: AnyObject {
    func start()
    func start(with option: DeepLinkOption?)
}
