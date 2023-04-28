//
//  MainView.swift
//  iUnits
//
//  Created by Israel Manzo on 4/27/23.
//

import SwiftUI

struct MainView: View {
    
    var data = Array(1...20)
    var adaptiveColumns: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: 2)
    }
    
    var images = ["ruler", "water.waves", "speedometer", "heat.element.windshield"]
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(images, id: \.self) { image in
                        GridItemView(image: image)
                            .onTapGesture {
                                print("tap")
                                self.isPresented = true
                            }
                    }
                }
                .sheet(isPresented: $isPresented, content: {
                    EmptyView()
                })
                .padding()
            }
            .navigationTitle("iUnits")
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct GridItemView: View {
    
    var image: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Spacer()
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 1), lineWidth: 1)
        }
    }
}
