//
//  ContentView.swift
//  nasa-api-practice
//
//  Created by toño on 21/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var fotoVM = PhotoViewModel()
    
    var body: some View {
        VStack {
            
            List(fotoVM.arrPhotos) { item in
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.headline)
                    
                    // Added nil check for safer unwrapping
                    if let urlString = item.url, let url = URL(string: urlString) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                                .frame(height: 100)
                        }
                        .frame(height: 100)
                    }
                    
                    Text(item.explanation)
                        .font(.caption)
                        .lineLimit(3)
                }
                .padding(.vertical, 4)
            }
            .task {
                do {
                    try await fotoVM.getPhotosNasa()
                } catch {
                    print("error al llamar a las fotos: \(error)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
