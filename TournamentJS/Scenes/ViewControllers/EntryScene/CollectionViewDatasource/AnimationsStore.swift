//
// Created by Dossymkhan Zhulamanov on 23.06.2022.
//

import Foundation

struct AnimationsStore {

    private let pages: [Page] = [
        Page(animationName: "Hello",
                title: "Always there to help",
                description: "" ),
        Page(animationName: "Coding",
                title: "Learn to code",
                description: "Find great mentors and learn about best coding practices"),
        Page(animationName: "Gaming",
                title: "Have fun time with friends",
                description: "Wanna challenge yourself? Get yourself into a tournament and get acquainted with exciting people")
    ]

    func allPages() -> [Page] {
        pages
    }
}