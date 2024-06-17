//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct Artworks: View {
    
    @ObservedObject var artworksvm = ArtworksViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(artworksvm.artworks) { artwork in
                    NavigationLink{
                        ArtworkDetail(artwork: artwork)
                    } label: {
                        Text(artwork.title ?? "")
                    }
                }
            }
            .task{
                await artworksvm.fetchArtworks()
            }
            .listStyle(.grouped)
            .navigationTitle("Artworks")
            .alert(isPresented: $artworksvm.hasErr, error: artworksvm.error, actions: {
                Text("")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Artworks()
    }
}
