//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

//protocol ViewModel {
//    associatedtype Services
//    init(withServices services: Services)
//}
//
//protocol ViewModelBased: AnyObject {
//    associatedtype ViewModelType: ViewModel
//    var viewModel: ViewModelType { get set }
//}
//
//extension ViewModelBased where Self: UIViewController {
//    static func instantiate(with viewModel: ViewModel) -> Self {
//        let viewController = Self.instantiate()
//        viewController.viewModel = viewModel
//        return viewController
//    }
//}
//
//extension ViewModelBased where Self: UIViewController {
//    static func instanciate<ServicesT>(withServices services: ServicesT) -> Self
//            where ServicesT == ViewModel.Services {
//        let viewController = Self.instantiate()
//        viewController.viewModel = ViewModelType.init(withServices: services)
//        return viewController
//    }
//}