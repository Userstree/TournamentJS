//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol SignUpView: BaseView {
    var onSignUpComplete: (() -> Void)? { get set }
}
