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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(UnitCategories.allCases, id: \.self) { category in
                        NavigationLink {
                            CaculationsView(vm: CalculationsViewModel(category))
                        } label: {
                            GridItemView(unit: category)
                        }.tint(Color(.label))
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
    
    var unit: UnitCategories

    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(unit.rawValue.capitalized)
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
