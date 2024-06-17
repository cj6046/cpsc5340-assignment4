//
//  ArtworkModel.swift
//  Assignment3
//
//  Created by Amberley Harris on 6/9/24.
//

import Foundation

struct ArtworkResponse : Codable {
    let pagination : PaginationModel
    let data : [ArtworkModel]
}

struct PaginationModel : Codable {
    let total : Int
}

struct ArtworkModel : Codable, Identifiable {
    let id : Int
    let title : String?
    let date_display : String?
    let artist_display : String?
    let medium_display : String?
    let copyright_notice : String?
    let image_id : String?
}
