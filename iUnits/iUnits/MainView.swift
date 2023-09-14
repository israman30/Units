//
//  MainView.swift
//  iUnits
//
//  Created by Israel Manzo on 4/27/23.
//

import SwiftUI

struct Unit: Identifiable {
    var id = UUID()
    let image: String
}

class UnitViewModel: ObservableObject {
    @Published var images = [Unit]()
    @Published var isPresented: Unit? = nil
    
    init() {
        images = [
            Unit(image: "ruler"), Unit(image: "water.waves"), Unit(image: "speedometer"), Unit(image: "heat.element.windshield")
        ]
    }
}

struct MainView: View {
    
    var data = Array(1...20)
    var adaptiveColumns: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: 2)
    }
    
    @StateObject private var vm = UnitViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.images) { unit in
                        GridItemView(image: unit.image)
                            .onTapGesture {
                                print("tap")
                                self.vm.isPresented = unit
                            }
                    }
                    .fullScreenCover(item: $vm.isPresented) { unit in
                        GridItemDetailView(image: unit.image)
                    }
                }
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
