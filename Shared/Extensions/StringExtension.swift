//
//  StringExtension.swift
//  JsonPlaceHolder (iOS)
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import Foundation

extension String {
    func getImageUrlFromString() -> URL {
        guard let urlImage = URL(string: self) else {
            return URL(string: ApiPaths.shared.defaultPhotoUrl)!
        }
        return urlImage
    }
}
