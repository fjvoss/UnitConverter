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
    @State private var inputValue = Double(100)
    
    var temperatureInCelsius: Double {
        switch inputUnit {
        case "Celsius":
            return inputValue
        case "Fahrenheit":
            return (inputValue - 32) * 5 / 9
        case "Kelvin":
            return inputValue - 273.15
        default:
            return inputValue // todo
        }
    }
    
    var temperatureInSelectedUnits: Double {
        switch outputUnit {
        case "Celsius":
            return temperatureInCelsius
        case "Fahrenheit":
            return temperatureInCelsius * 9 / 5 + 32
        case "Kelvin":
            return temperatureInCelsius + 273.15
        default:
            return temperatureInCelsius // todo
        }
    }
    
    var body: some View {
        Form {
            Section("Temperature to convert") {
                TextField("Amount", value: $inputValue, format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("From") {
                Picker("Input unit", selection: $inputUnit) {
                    ForEach(unitOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("To") {
                Picker("Output unit", selection: $outputUnit) {
                    ForEach(unitOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
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
