//
//  PhotoDetailView.swift
//  JsonPlaceHolder (iOS)
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import SwiftUI

struct PhotoDetailView: View {
    var photo: Photo
    var album: Album
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: photo.url.getImageUrlFromString(),
                           placeholder: {
                            Text("Loading ...")
                           },
                           image: {
                            Image(uiImage: $0).resizable()
                           }).scaledToFit()
                    .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
                
                VStack {
                    Text("Title")
                        .bold()
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .center)
                        .background(Color.init(red: 0, green: 0, blue: 0, opacity: 0.05))
                    
                    Text(photo.title)
                        .font(.body)
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .center)
                        .padding(.vertical, 0.5)
                    
                    Text("Image id")
                        .bold()
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .center)
                        .background(Color.init(red: 0, green: 0, blue: 0, opacity: 0.05))
                    
                    Text(String(photo.id))
                        .font(.body)
                        .frame(alignment: .center)
                        .padding(.vertical, 0.5)
                    
                    Text("User id")
                        .bold()
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .center)
                        .background(Color.init(red: 0, green: 0, blue: 0, opacity: 0.05))
                    
                    Text(String(album.userID))
                        .font(.body)
                        .frame(alignment: .center)
                        .padding(.vertical, 0.5)
                    
                    Text("Album")
                        .bold()
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .center)
                        .background(
                            Color.init(red: 0, green: 0, blue: 0, opacity: 0.05)
                        )
                    
                    Text("#\(String(photo.albumID))")
                        .font(.body)
                        .frame(alignment: .center)
                        .padding(.vertical, 0.5)
                    
                    Text("Album title:")
                        .bold()
                        .font(.title3)
                        .frame(maxWidth:.infinity, alignment: .center)
                        .background(Color.init(red: 0, green: 0, blue: 0, opacity: 0.05))
                    
                    Text(String(album.title))
                        .font(.body)
                        .frame(alignment: .center)
                        .padding(.vertical, 0.5)
                    
                }.background(Color.init(red: 0, green: 0, blue: 0, opacity: 0.02))
                
                Link(destination: photo.url.getImageUrlFromString(), label:{
                    Text("Image link")
                        .bold()
                        .font(.title2)
                        .frame(width: 190, height: 30)
                        .padding(.all, 16)
                        .background(Color(.systemOrange))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }).frame(width: 100, height: 100, alignment: .center)
                .padding(.vertical, 10)
                
            }.navigationBarTitle("Photo detail #\(photo.id)", displayMode: .inline)
            .border(Color.gray)
            .padding(.all, 3)
        }
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(photo: Photo(albumID: 0,
                                     id: 0,
                                     title: "",
                                     url: "",
                                     thumbnailURL: ""),
                        album: Album(userID: 0, id: 0, title: "")
        )
    }
}
