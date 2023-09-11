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
    case kilometers
    case miles
    case inches
    case feet
    case yards
}


struct CaculationsView: View {
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 2
    @State private var outputUnitValue = 2
    
    @State var inputUnits: [Length] = [.millimeters, .inches, .centimeters, .feet, .meters, .yards, .kilometers, .miles]
    @State var outputUnits: [Length] = [.millimeters, .inches, .centimeters, .feet, .meters, .yards, .kilometers, .miles]
    
    var result: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        
        switch inputUnits[inputUnitValue] {
        case .inches:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.inches)
        case .millimeters:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.millimeters)
        case .meters:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        case .feet:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
        case .yards:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.yards)
        case .kilometers:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.kilometers)
        case .miles:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        }
        
        switch outputUnits[outputUnitValue] {
        case .inches:
            output = "\(input.converted(to: UnitLength.inches))"
        case .millimeters:
            output = "\(input.converted(to: UnitLength.millimeters))"
        case .feet:
            output = "\(input.converted(to: UnitLength.feet))"
        case .meters:
            output = "\(input.converted(to: UnitLength.meters))"
        case .yards:
            output = "\(input.converted(to: UnitLength.yards))"
        case .kilometers:
            output = "\(input.converted(to: UnitLength.kilometers))"
        case .miles:
            output = "\(input.converted(to: UnitLength.miles))"
        default:
            output = "\(input.converted(to: UnitLength.meters))"
        }
        
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
                        Text("\(inputUnits[unit].rawValue)")
                    }
                }
                Text("To")
                Picker("", selection: $outputUnitValue) {
                    ForEach(0..<outputUnits.count, id: \.self) { unit in
                        Text("\(outputUnits[unit].rawValue)")
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
