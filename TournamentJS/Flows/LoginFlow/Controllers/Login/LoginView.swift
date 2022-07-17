//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol LoginView: BaseView {
    var onCompleteAuth: (() -> Void)? { get set }
    var onSignUpButtonTap: (() -> Void)? { get set }
}
