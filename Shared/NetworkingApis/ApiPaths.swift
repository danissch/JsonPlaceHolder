//
//  ApiPaths.swift
//  JsonPlaceHolder (iOS)
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import Foundation

struct ApiPaths {
    static let shared = ApiPaths()
    
    let albumsUrl = "https://jsonplaceholder.typicode.com/albums"
    let photosUrl = "https://jsonplaceholder.typicode.com/photos"
    
    let defaultPhotoUrl = "https://apod.nasa.gov/apod/image/2106/ZhurongRover_CNSA_1080.jpg"
}
