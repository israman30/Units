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

class CalculationsViewModel: ObservableObject {
    @Published var inputValue = ""
    @Published var outputValue = ""
    
    @Published var inputUnitValue = 2
    @Published var outputUnitValue = 2
    
    @Published var inputUnits: [Length] = [.millimeters, .inches, .centimeters, .feet, .meters, .yards, .kilometers, .miles]
    @Published var outputUnits: [Length] = [.millimeters, .inches, .centimeters, .feet, .meters, .yards, .kilometers, .miles]
    
    var result: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        
        switch inputUnits[inputUnitValue] {
        case .meters:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        case .inches:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.inches)
        case .millimeters:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.millimeters)
        case .centimeters:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.centimeters)
        case .feet:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
        case .yards:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.yards)
        case .kilometers:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.kilometers)
        case .miles:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
        }
        
        switch outputUnits[outputUnitValue] {
        case .meters:
            output = String(describing: input.converted(to: UnitLength.meters))
        case .inches:
            output = String(describing: input.converted(to: UnitLength.inches))
        case .millimeters:
            output = String(describing: input.converted(to: UnitLength.millimeters))
        case .centimeters:
            output = String(describing: input.converted(to: UnitLength.centimeters))
        case .feet:
            output = String(describing: input.converted(to: UnitLength.feet))
        case .yards:
            output = String(describing: input.converted(to: UnitLength.yards))
        case .kilometers:
            output = String(describing: input.converted(to: UnitLength.kilometers))
        case .miles:
            output = String(describing: input.converted(to: UnitLength.miles))
        }
        
        return output
    }
}


struct CaculationsView: View {
    
    @StateObject private var vm: CalculationsViewModel
    
    init() {
        self._vm = StateObject(wrappedValue: CalculationsViewModel())
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading) {
                    TextField("Enter value", text: $vm.inputValue)
                }
                .padding()
                .cornerRadius(5)
                .padding(3)
                .foregroundColor(Color(.label))
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
                .font(.title2)
                .padding()
                
                Text(vm.result)
                    .font(.largeTitle)
            }
            .padding(.vertical)
            
            
            VStack(alignment: .leading)  {
                Text("From")
                Picker("", selection: $vm.inputUnitValue) {
                    ForEach(0..<vm.inputUnits.count, id: \.self) { unit in
                        Text("\(vm.inputUnits[unit].rawValue)")
                    }
                }
                Text("To")
                Picker("", selection: $vm.outputUnitValue) {
                    ForEach(0..<vm.outputUnits.count, id: \.self) { unit in
                        Text("\(vm.outputUnits[unit].rawValue)")
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
