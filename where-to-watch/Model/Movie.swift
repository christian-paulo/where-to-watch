//
//  Movie.swift
//  where-to-watch
//
//  Created by Christian Paulo on 18/10/22.
//

import Foundation

struct Welcome : Codable {
    let results : [Movie]
}

struct Movie : Codable {
    let name : String
    let id : Int
}

struct MovieDetail : Codable {
    let title : String
    let id : Int
    let poster : String
}

