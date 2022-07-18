//
// Created by Dossymkhan Zhulamanov on 18.07.2022.
//

class NetworkingService {
    func makeHTTPRequest() {
        print("http request was made")
    }
}

protocol HasNetworkingService {
    var networking: NetworkingService { get }
}

