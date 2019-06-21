//
//  SwiftUIView.swift
//  Async ImageLoader
//
//  Created by Saif on 21/06/19.
//  Copyright © 2019 LeftRightMind. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: BindableObject {
    
    var downloadedImage: UIImage?
    let didChange = PassthroughSubject<ImageLoader?,Never>()
    
    func load(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            fatalError("Image Url is not correct")
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.didChange.send(nil)
                }
                return
            }
            
            self.downloadedImage = UIImage(data:data)
            
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
                        
        }.resume()
        
        
        
    }
    
    
}
