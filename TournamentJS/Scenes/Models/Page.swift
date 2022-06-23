//
// Created by Dossymkhan Zhulamanov on 23.06.2022.
//

import Foundation

protocol PageDataSource {
    var animationName: String { get }
    var title: String { get }
    var description: String { get }
}

struct Page: PageDataSource {
    let animationName: String
    let title: String
    let description: String
}
