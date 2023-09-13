//
//  CalculationsViewModel.swift
//  iUnits
//
//  Created by Israel Manzo on 9/12/23.
//

import Foundation

class CalculationsViewModel: ObservableObject {
    @Published var inputValue = ""
    @Published var outputValue = ""
    
    @Published var inputUnitValue = 2
    @Published var outputUnitValue = 2
    
    @Published var inputUnits: [Length] = [.millimeters, .inches, .centimeters, .feet, .meters, .yards, .kilometers, .miles]
    @Published var outputUnits: [Length] = [.millimeters, .inches, .centimeters, .feet, .meters, .yards, .kilometers, .miles]
    
    var unitCatergory: UnitCategories
    
    init(_ unitCategory: UnitCategories) {
        self.unitCatergory = unitCategory
    }
    
    func convert<T: Dimension>(value: String, fristUnit: T, secondUnit: T) -> Double {
        Measurement(value: (Double(value) ?? 0.0), unit: fristUnit).converted(to: secondUnit).value
    }
    
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
