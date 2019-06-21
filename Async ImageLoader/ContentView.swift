//
//  ContentView.swift
//  Async ImageLoader
//
//  Created by Saif on 21/06/19.
//  Copyright © 2019 LeftRightMind. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    let url = "http://www.mypet.com/img/basic-pet-care/how-long-leave-cat-alone-lead.jpg"
    
    var body: some View {
        URLImage(url: url)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
