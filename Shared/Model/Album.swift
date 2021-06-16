//
//  Album.swift
//  JsonPlaceHolder (iOS)
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import Foundation

// MARK: - Album
struct Album: Identifiable, Decodable {
    let userID, id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
    
    init(userID: Int, id: Int, title: String){
        self.userID = userID
        self.id = id
        self.title = title
    }
    
}
