//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol AuthCoordinatorOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}
