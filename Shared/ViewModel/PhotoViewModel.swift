//
//  PhotoViewModel.swift
//  JsonPlaceHolder (iOS)
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import Foundation

class PhotoViewModel: ObservableObject {
    @Published var photos:[Photo] = []
    
    func getPhotos(album: Album){
        guard let url = URL(string: ApiPaths.shared.photosUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            if let photos = try? JSONDecoder().decode([Photo].self, from: data) {
                DispatchQueue.main.async {
                    self.photos = photos.filter({$0.albumID == album.id })
                }
            } else {
                print("Fail: \(error?.localizedDescription ?? "Error fetching data")")
            }
        }.resume()
    }
    
}
