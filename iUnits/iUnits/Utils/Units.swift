//
//  Units.swift
//  iUnits
//
//  Created by Israel Manzo on 9/12/23.
//

import SwiftUI

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
            Unit(image: "ruler", name: "Length"),
            Unit(image: "water.waves", name: "Measurement"),
            Unit(image: "speedometer", name: "Speed"),
            Unit(image: "triangle", name: "Area"),
            Unit(image: "cube.transparent", name: "Volumen"),
            Unit(image: "soccerball.circle.inverse", name: "Mass"),
            Unit(image: "t.circle", name: "Temperature"),
            Unit(image: "backpack.circle", name: "Pressure")
        ]
    }
}
