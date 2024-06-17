//
//  ArtworksViewModel.swift
//  Assignment3
//
//  Created by Amberley Harris on 6/9/24.
//

import Foundation

class ArtworksViewModel : ObservableObject {
    
    @Published private(set) var artworks = [ArtworkModel]()
    @Published var hasErr = false
    @Published var error : ArtworkError?
    
    private let url = "https://api.artic.edu/api/v1/artworks?page=5&limit=100"
    
    @MainActor
    func fetchArtworks() async {
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(ArtworkResponse?.self, from: data) else {
                    self.hasErr.toggle()
                    self.error = ArtworkError.decodeError
                    return
                }
                self.artworks = results.data
            } catch {
                self.hasErr.toggle()
                self.error = ArtworkError.customError(error: error)
            }
        }
    }
}

extension ArtworksViewModel {
    enum ArtworkError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}
