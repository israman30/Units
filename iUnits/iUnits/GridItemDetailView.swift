//
//  GridItemView.swift
//  iUnits
//
//  Created by Israel Manzo on 4/27/23.
//

import SwiftUI

struct GridItemDetailView: View {
    var image: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "xmark.app")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                        .onTapGesture {
                            self.dismiss()
                        }
                }
                Spacer()
            }
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemDetailView(image: "water.waves")
    }
}
