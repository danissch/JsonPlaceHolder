//
//  AlbumViewModel.swift
//  JsonPlaceHolder (iOS)
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import Foundation

class AlbumViewModel: ObservableObject {
    @Published var albums: [Album] = []
    
    func getAlbums(){
        guard let url = URL(string: ApiPaths.shared.albumsUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            if let albums = try? JSONDecoder().decode([Album].self, from: data) {
                //do something with myStruct
                DispatchQueue.main.async {
                    self.albums = albums
                }
            } else {
                print("Fail: \(error?.localizedDescription ?? "Error fetching data")")
            }
        }.resume()
    }
}
