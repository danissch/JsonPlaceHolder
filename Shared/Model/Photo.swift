//
//  Photo.swift
//  JsonPlaceHolder (iOS)
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
    
    init(albumID: Int, id: Int, title: String, url: String, thumbnailURL: String) {
        self.albumID = albumID
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailURL = thumbnailURL
    }
    
}
