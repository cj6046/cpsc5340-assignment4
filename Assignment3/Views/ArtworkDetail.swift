//
//  ArtworkDetail.swift
//  Assignment3
//
//  Created by Amberley Harris on 6/9/24.
//

import SwiftUI

struct ArtworkDetail: View {
    
    var artwork : ArtworkModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(artwork.title ?? "")
                .font(.system(size: 50))
                .padding(.horizontal, 60)
            Text(artwork.artist_display ?? "")
                .font(.system(size: 20))
                .padding(.horizontal, 60)
            ImageCardView(imageId: artwork.image_id ?? "")
            Text(artwork.medium_display ?? "")
                .font(.system(size: 20))
                .padding(.horizontal, 60)
            Text(artwork.date_display ?? "")
                .font(.system(size: 20))
                .padding(.horizontal, 60)
            Text(artwork.copyright_notice ?? "")
                .font(.system(size: 20))
                .padding(.horizontal, 60)
        }
    }
}

