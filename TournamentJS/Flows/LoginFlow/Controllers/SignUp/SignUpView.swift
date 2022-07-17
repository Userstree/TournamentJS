//
// Created by Dossymkhan Zhulamanov on 16.07.2022.
//

protocol SignUpView: BaseView {

    var confirmed: Bool { get set }
    var onSignUpComplete: (() -> Void)? { get set }
    var onTermsButtonTap: (() -> Void)? { get set }

    func conformTermsAgreement(_ agree: Bool)
}
