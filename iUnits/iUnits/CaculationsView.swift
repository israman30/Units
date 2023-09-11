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
    
//    @State var inputUnitValue = 0
//    @State var oututUnitValue = 0
//    @State var unitConverted = 0
    
    
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 2
    @State private var outputUnitValue = 2
    
    @State var inputUnits = ["meters", "feet", "miles"]
    @State var outputUnits = ["meters", "feet", "miles"]
    
    var result: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        
        switch inputUnits[inputUnitValue] {
        case "meters":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        case "feet":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
        case "miles":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        }
        
        switch outputUnits[outputUnitValue] {
        case "meters":
            output = "\(input.converted(to: UnitLength.meters))"
        case "feet":
            output = "\(input.converted(to: UnitLength.feet))"
        case "miles":
            output = "\(input.converted(to: UnitLength.miles))"
        default:
            output = "\(input.converted(to: UnitLength.meters))"
        }
        
//        var value = Int(inputText)!
        
//        switch Length.allCases[inputUnitValue] {
//        case .millimeters:
//            unitConverted = value * Int(0.1)
//        case .centimeters:
//            unitConverted = value
//        case .meters:
//            unitConverted = value * 100
//        case .kilimeters:
//            break
//        case .miles:
//            break
//        }
        
        return output
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading) {
                    TextField("Enter value", text: $inputValue)
                }
                .padding()
                .cornerRadius(5)
                .padding(3)
                .foregroundColor(Color(.label))
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
                .font(.title2)
                .padding()
                
                Text(result)
                    .font(.largeTitle)
            }
            .padding(.vertical)
            
            
            VStack(alignment: .leading)  {
                Text("From")
                Picker("", selection: $inputUnitValue) {
                    ForEach(0..<inputUnits.count, id: \.self) { unit in
                        Text("\(inputUnits[unit])")
                    }
                }
                Text("To")
                Picker("", selection: $outputUnitValue) {
                    ForEach(0..<outputUnits.count, id: \.self) { unit in
                        Text("\(outputUnits[unit])")
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
