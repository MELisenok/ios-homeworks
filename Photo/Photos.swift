//
//  Photos.swift
//  Navigation
//
//  Created by Лена on 4/20/23.
//

import Foundation
import UIKit

struct Photos{
    var image: String
    
    //функция возвращает массив фото:
    static func selectPhoto() -> [Photos] {
        return [
            Photos(image: "dog1"),
            Photos(image: "dog2"),
            Photos(image: "dog3"),
            Photos(image: "dog4"),
            Photos(image: "dog5"),
            Photos(image: "dog6"),
            Photos(image: "dog7"),
            Photos(image: "dog8"),
            Photos(image: "dog9"),
            Photos(image: "dog10"),
            Photos(image: "dog10"),
            Photos(image: "dog12"),
            Photos(image: "dog13"),
            Photos(image: "dog14"),
            Photos(image: "dog15"),
            Photos(image: "dog16"),
            Photos(image: "dog17"),
            Photos(image: "dog18"),
            Photos(image: "dog19"),
            Photos(image: "dog20")
        ]
    }
}
