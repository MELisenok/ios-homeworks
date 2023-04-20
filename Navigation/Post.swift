//
//  Post.swift
//  Navigation
//
//  Created by Лена on 3/15/23.
//


import Foundation
import UIKit

//создаю модель публикации:
struct Post{
    var author: String
    var description: String
    var image: UIImage
    var likes: Int
    var views: Int
    
    //функция возвращает массив постов:
    static func makePost() -> [Post] {
        return [
            Post(author: "Эльф", description: "Хочу на море!!!", image: UIImage(named: "Elf_sea")!, likes: 1000, views: 1100),
            Post(author: "Эльф", description: "Обожаю прогулки на природе", image: UIImage(named: "Elf_mountains")!, likes: 1564, views: 2136),
            Post(author: "Эльф", description: "Раньше я улыбался)", image: UIImage(named: "Elf_smile")!, likes: 1001, views: 1001),
            Post(author: "Эльф", description: "Чья ножка красивей?", image: UIImage(named: "Elf_love")!, likes: 7777, views: 7867)
        ]
    }
}

