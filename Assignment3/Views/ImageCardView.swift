//
//  ImageCardView.swift
//  Assignment3
//
//  Created by Amberley Harris on 6/9/24.
//

import SwiftUI

struct ImageCardView: View {
    var imageId : String
    
    var body: some View {
        AsyncImage(url: constructImageURL(id: imageId)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 500)
        } placeholder: {
            ProgressView()
        }
    }
}

func constructImageURL(id : String) -> URL {
    var str = "https://www.artic.edu/iiif/2/\(id)/full/843,/0/default.jpg"
    
    return URL(string: str)!
}

#Preview {
    ImageCardView(imageId: "be85aecc-d0dc-9325-4893-3128bc559668")
}
