//
//  GridItemView.swift
//  iUnits
//
//  Created by Israel Manzo on 4/27/23.
//

import SwiftUI

struct GridItemDetailView: View {
    var image: String
    
    var body: some View {
        Image(systemName: image)
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemDetailView(image: "water.waves")
    }
}
