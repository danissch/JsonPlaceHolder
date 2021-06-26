//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import SwiftUI

struct AlbumListView: View {
    @ObservedObject var albumViewModel = AlbumViewModel()
    
    var body: some View {
        NavigationView {
            List(albumViewModel.albums, id: \.id) { album in
                NavigationLink(
                    destination: PhotoListView(album: album), label: {
                        VStack(alignment: .leading, spacing: 0, content: {
                            HStack {
                                HStack {
                                    Text("Album #\(String(album.id))")
                                        .bold()
                                        .italic()
                                        .font(.title3)
                                        .foregroundColor(.gray).padding(.horizontal, 7)
                                }.background(
                                    Color.init(
                                        red: 0,
                                        green: 0,
                                        blue: 0,
                                        opacity: 0.05
                                    )
                                ).padding(.all, 0).cornerRadius(.pi * 2)
                                
                                HStack {
                                    Text("By user \(String(album.userID))")
                                        .bold()
                                        .font(.caption2)
                                        .foregroundColor(
                                            .gray.opacity(0.9)
                                        )
                                }.frame(maxWidth: .infinity, alignment: .topTrailing)
                                
                            }
                            
                            Text("\(String(album.title))")
                                .font(.subheadline)
                                .padding(.all, 7)
                                .foregroundColor(
                                    .gray.opacity(0.5)
                                )
                                .frame(alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                        }).frame(maxWidth: .infinity, maxHeight: .infinity).padding(.vertical, 5)
                    }).frame(maxWidth: .infinity)
            }.navigationBarTitle("Album list")
        }.padding(.all, 0.0)
        .onAppear(perform: {
            self.albumViewModel.getAlbums()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
