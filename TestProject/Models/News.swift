//
//  News.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

struct News: Decodable {
    //ეს decodable უნდა ყოფილიყო
    let author: String?
    //authors ეწერა ამის მაგივრად
    let title: String?
    let urlToImage: String?
}
