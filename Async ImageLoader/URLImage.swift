//
//  URLImage.swift
//  Async ImageLoader
//
//  Created by Saif on 21/06/19.
//  Copyright © 2019 LeftRightMind. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    
    @ObjectBinding private var imageLoader = ImageLoader()
    
    var placeholder: Image
    
    init(url: String, placeholder: Image = Image(systemName:"photo")) {
        self.placeholder = placeholder
        self.imageLoader.load(url: url)
    }
    
    var body : some View {
        if let uiImage = self.imageLoader.downloadedImage {
            return Image(uiImage:uiImage)
        }
        else{
            return placeholder
        }
    }
}

#if DEBUG
struct URLImage_Previews : PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}
#endif
