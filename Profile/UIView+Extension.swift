//
//  UIView+Extension.swift
//  Navigation
//
//  Created by Лена on 4/15/23.
//

import UIKit

//будет возвращатьяс название класса как именно он называется
extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}
