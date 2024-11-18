//
//  ContentView.swift
//  UnitConverter
//
//  Created by Fiona Voss on 11/18/24.
//

import SwiftUI

struct ContentView: View {
    let unitOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Fahrenheit"
    @State private var inputValue = 100
    
    var temperatureInCelsius: Int {
        switch inputUnit {
        case "Celsius":
            return inputValue
        case "Fahrenheit":
            return inputValue // todo
        case "Kelvin":
            return inputValue // todo
        default:
            return inputValue // todo
        }
    }
    
    var temperatureInSelectedUnits: Int {
        switch outputUnit {
        case "Celsius":
            return temperatureInCelsius
        case "Fahrenheit":
            return temperatureInCelsius // todo
        case "Kelvin":
            return temperatureInCelsius // todo
        default:
            return temperatureInCelsius // todo
        }
    }
    
    var body: some View {
        Form {
            Section("Input unit") {
                Picker("Input unit", selection: $inputUnit) {
                    ForEach(unitOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Output unit") {
                Picker("Output unit", selection: $outputUnit) {
                    ForEach(unitOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Value") {
                TextField("Amount", value: $inputValue, format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("Result") {
                Text(temperatureInSelectedUnits, format: .number)
            }
        }
    }
}

#Preview {
    ContentView()
}
