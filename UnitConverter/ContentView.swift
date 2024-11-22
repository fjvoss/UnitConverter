//
//  ContentView.swift
//  UnitConverter
//
//  Created by Fiona Voss on 11/18/24.
//

import SwiftUI

enum TemperatureUnit: CaseIterable, Identifiable, CustomStringConvertible {
    case celsius
    case fahrenheit
    case kelvin
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        case .kelvin:
            return "Kelvin"
        }
    }
}

struct ContentView: View {
    let unitOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @State private var inputUnit = TemperatureUnit.celsius
    @State private var outputUnit = TemperatureUnit.fahrenheit
    @State private var inputValue = Double(100)
    
    var temperatureInCelsius: Double {
        switch inputUnit {
        case .celsius:
            return inputValue
        case .fahrenheit:
            return (inputValue - 32) * 5 / 9
        case .kelvin:
            return inputValue - 273.15
        }
    }
    
    var temperatureInSelectedUnits: Double {
        switch outputUnit {
        case .celsius:
            return temperatureInCelsius
        case .fahrenheit:
            return temperatureInCelsius * 9 / 5 + 32
        case .kelvin:
            return temperatureInCelsius + 273.15
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
                    ForEach(TemperatureUnit.allCases) { option in
                        Text(String(describing: option))
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("To") {
                Picker("Output unit", selection: $outputUnit) {
                    ForEach(TemperatureUnit.allCases) { option in
                        Text(String(describing: option))
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
