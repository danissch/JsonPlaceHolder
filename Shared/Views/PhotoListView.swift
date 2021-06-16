//
//  PhotoListView.swift
//  JsonPlaceHolder (iOS)
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import SwiftUI

struct PhotoListView: View {
    @ObservedObject var photoViewModel = PhotoViewModel()
    var album: Album
    
    var body: some View {
        List(photoViewModel.photos, id: \.id) { photo in
            NavigationLink(
                destination: PhotoDetailView(photo: photo, album: album),
                label: {
                    HStack {
                        AsyncImage(
                            url: photo.thumbnailURL.getImageUrlFromString(),
                            placeholder: { Text("Loading ...").font(.footnote) },
                            image: {
                                Image(uiImage: $0).resizable()
                            })
                            .frame(width: 90 , height: 90)
                            .cornerRadius(6)
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            HStack {
                                Text("Photo #\(String(photo.id))")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(
                                        Color.init(red: 0,
                                                   green: 0,
                                                   blue: 0,
                                                   opacity: 0.6)
                                    )
                                
                            }.frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            HStack {
                                Text("Album \(String(photo.albumID))")
                                    .bold()
                                    .font(.callout)
                                    .foregroundColor(
                                        Color.init(red: 0,
                                                   green: 0,
                                                   blue: 0,
                                                   opacity: 0.5)
                                    )
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                        }).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        
                    }
                    
                })
            
        }
        .navigationTitle("Photo list")
        .onAppear(perform: {
            self.photoViewModel.getPhotos(album: album)
        })
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView(album: Album(userID: 0, id: 0, title: ""))
    }
}
