//
//  UnitView.swift
//  iUnits
//
//  Created by Israel Manzo on 4/27/23.
//

import SwiftUI

/*
 1cm = 10mmm
 1m = 100cm
 1km = 1000m
 
 cm to mm = 1/10
 */

struct UnitView: View {
    
    @State var inpuText = ""
    var units = ["length", "liquid", "weight"]
    var lengthFrom = ["mm", "cm", "dm", "m", "dam", "hm", "km"]
    var lengthTo = ["mm", "cm", "dm", "m", "dam", "hm", "km"]
    @State var selectedUnit = "metric"
    @State var startLength = "cm"
    @State var lastLength = "m"
    @State var outputUnit = ""
    @State var unitText = ""
    @State var inputUnitValue = 0
    @State var outUnitValue = 0
    @State var outputUnits = 0
    
    var result: Double {
        let value = (Double(inpuText) ?? 0) / 0.01
        
        var inputAsFeet: Double = 0
        var output: Double = 0
        
//        switch lengthFrom[inputUnitValue].lowercased() {
//        case "mm":
//            
//        }
        
        return output
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Text(inpuText.isEmpty ? "0" : inpuText)
                        .font(.largeTitle)
                        .foregroundColor(Color(.label))
                    HStack {
                        VStack {
                            Picker(selection: $selectedUnit) {
                                ForEach(units, id: \.self) { unit in
                                    Text(unit)
                                }
                            } label: { }
                            Picker(selection: $startLength) {
                                ForEach(lengthFrom, id: \.self) { unit in
                                    Text(unit)
                                }
                            } label: { }
                        }
                        
                        VStack(alignment: .leading) {
                            TextField("Enter value", text: $inpuText)
                            
                        }
                        .padding()
                        .cornerRadius(20)
                        .padding(3)
                        .foregroundColor(Color(.label))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
                        .font(.title2)
                        .shadow(radius: 10)
                        .padding()
                    }
                    
                    Spacer()
                    
                    Text(inpuText.isEmpty ? "0" : "\(result)")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    VStack {
                        NeumorphicStyleTextField(textField: TextField("Enter value", text: $inpuText), imageName: "")
                            .padding()
                            .font(.title)
                        HStack {
                            Picker(selection: $selectedUnit) {
                                ForEach(units, id: \.self) { unit in
                                    Text(unit)
                                }
                            } label: { }
                            Spacer()
                            Picker(selection: $startLength) {
                                ForEach(lengthFrom, id: \.self) { unit in
                                    Text(unit)
                                }
                            } label: { }
                            Picker(selection: $lastLength) {
                                ForEach(lengthTo, id: \.self) { unit in
                                    Text(unit)
                                }
                            } label: { }
                        }
                        .padding()
                        
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("iUnit Calculate")
        }
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView()
    }
}

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let neumorphictextColor = Color(red: 132 / 255, green: 132 / 255, blue: 132 / 255)
}

struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>
    var imageName: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.darkShadow)
            textField
            }
            .padding()
            .foregroundColor(.neumorphictextColor)
            .background(Color.background)
            .cornerRadius(6)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)

        }
}
