//
//  ContentView.swift
//  100DS-CH1-Conversions
//
//  Created by Erica Sampson on 2024-07-11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var measurmentAmount = 0.0
    @State private var selectedInputUnit = "Kilometers"
    @State private var selectedOutputUnit = "Kilometers"
    
    let unitOptions = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var convertedOutput: Double {
        
        let inUnit: Unit
        let outUnit: Unit
        
        do {
            try inUnit = Converter.unitFor(string: selectedInputUnit)
        } catch {
            //set to supportedDefualt
            inUnit = .meters
        }
        
        do {
            try outUnit = Converter.unitFor(string: selectedOutputUnit)
        } catch {
            //set to supportedDefualt
            outUnit = .meters
        }
        
        return Converter.convert(measurmentAmount, startingUnit: inUnit, to: outUnit)
    }
    
    var body: some View {
        
        NavigationStack {
            
                Form {
                    Section("Starting Measurement") {
                        HStack {
                            TextField("Measurement", value: $measurmentAmount, format: .number)
                            Picker("", selection: $selectedInputUnit) {
                                
                                ForEach(unitOptions, id: \.self){
                                    Text($0)
                                }
                            }
                        }
                    }
                    
                    Section("Converted Measurement") {
                        HStack {
                            
                            Text(convertedOutput, format: .number)
                            Picker("", selection: $selectedOutputUnit) {
                                
                                ForEach(unitOptions, id: \.self){
                                    Text($0)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Length Conversion")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
