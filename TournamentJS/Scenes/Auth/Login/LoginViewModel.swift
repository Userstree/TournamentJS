//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

protocol LoginViewModelProtocol: ViewModel {

}

class LoginViewModel: NSObject, LoginViewModelProtocol {

    typealias Services = NetworkingService

    // MARK: - Init

    override init() {
        super.init()
    }

    required init(withServices services: Services) {
        super.init()

    }
}