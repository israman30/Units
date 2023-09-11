//
//  MainView.swift
//  iUnits
//
//  Created by Israel Manzo on 4/27/23.
//

import SwiftUI

//enum 

struct Unit: Identifiable {
    var id = UUID()
    let image: String
    let name: String
}

class UnitViewModel: ObservableObject {
    @Published var images = [Unit]()
    @Published var isPresented: Unit? = nil
    
    init() {
        images = [
            Unit(image: "ruler", name: "Lenght"),
            Unit(image: "water.waves", name: "Measurement"),
            Unit(image: "speedometer", name: "Speed"),
            Unit(image: "triangle", name: "Area"),
            Unit(image: "cube.transparent", name: "Area"),
            Unit(image: "soccerball.circle.inverse", name: "Mass"),
            Unit(image: "t.circle", name: "Temperature"),
            Unit(image: "backpack.circle", name: "Pressure")
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
                        GridItemView(unit: unit)
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
    
    var unit: Unit
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: unit.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 80, height: 50)
                    
                }
                
                Spacer()
                
                Text(unit.name)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
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
