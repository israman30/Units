//
//  CaculationsView.swift
//  iUnits
//
//  Created by Israel Manzo on 9/10/23.
//

import SwiftUI

struct CaculationsView: View {
    
    @StateObject var vm: CalculationsViewModel
    
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
            
            Form {
                Section("Selection") {
                    VStack(alignment: .leading)  {
                        HStack {
                            Text("From")
                            Picker("", selection: $vm.inputUnitValue) {
                                ForEach(0..<vm.inputUnits.count, id: \.self) { unit in
                                    Text("\(vm.inputUnits[unit].rawValue)")
                                }
                            }
                        }
                        HStack {
                            Text("To")
                            Picker("", selection: $vm.outputUnitValue) {
                                ForEach(0..<vm.outputUnits.count, id: \.self) { unit in
                                    Text("\(vm.outputUnits[unit].rawValue)")
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            Spacer()
        }
        .navigationTitle(vm.unitCatergory.rawValue.capitalized)
    }
}

struct CaculationsView_Previews: PreviewProvider {
    static var previews: some View {
        CaculationsView(vm: CalculationsViewModel(.length))
    }
}
