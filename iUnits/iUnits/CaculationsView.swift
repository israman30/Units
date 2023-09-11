//
//  CaculationsView.swift
//  iUnits
//
//  Created by Israel Manzo on 9/10/23.
//

import SwiftUI

enum Length: String, CaseIterable {
    case millimeters
    case centimeters
    case meters
    case kilimeters
    case miles
}


struct CaculationsView: View {
    
    @State var inputText = ""
    @State var units = ["centimeters", "meters", "kilometers", "miles"]
    @State var selectedUnitFrom: Length = .meters
    @State var selectedUnitTo: Length = .centimeters
    
    @State var inputUnitValue = 0
    @State var oututUnitValue = 0
    @State var unitConverted = 0
    
    var result: Double {
        
        var value = Int(inputText)!
        
        switch Length.allCases[inputUnitValue] {
        case .millimeters:
            unitConverted = value * Int(0.1)
        case .centimeters:
            unitConverted = value
        case .meters:
            unitConverted = value * 100
        case .kilimeters:
            break
        case .miles:
            break
        }
        
        return 0.0
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading) {
                    TextField("Enter value", text: $inputText)
                }
                .padding()
                .cornerRadius(5)
                .padding(3)
                .foregroundColor(Color(.label))
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
                .font(.title2)
                .padding()
                
                Text("0.0")
                    .font(.largeTitle)
            }
            .padding(.vertical)
            
            
            VStack(alignment: .leading)  {
                Text("From")
                Picker("", selection: $selectedUnitFrom) {
                    ForEach(Length.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }
                Text("To")
                Picker("", selection: $selectedUnitTo) {
                    ForEach(Length.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct CaculationsView_Previews: PreviewProvider {
    static var previews: some View {
        CaculationsView()
    }
}
