//
//  PhotoViewModel.swift
//  nasa-api-practice
//
//  Created by toño on 21/08/25.
//

import Foundation

@Observable
class PhotoViewModel : ObservableObject {
    var arrPhotos = [Photo]()
    
    func getPhotosNasa() async throws {
        
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=CQzyqmsNslnA8L5JbyIG4kewbWwyXoHo8aOrUeh3&count=10") else {
            print("invalid url")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        let results = try JSONDecoder().decode([Photo].self, from: data)
        
        print(results)
        
        DispatchQueue.main.async{
            self.arrPhotos = results
        }
    }
}
