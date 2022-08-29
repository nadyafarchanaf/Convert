//
//  ContentView.swift
//  Converter
//
//  Created by Nadya Farchana Fidaroina on 30/08/22.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var input = 0.0
    @State private var output = 0.0
    @State private var unitConversionInput = "Celcius"
    @State private var unitConversionOutput = "Celcius"
    var converter : Double {
        var resultConvert = 0.0
        if (unitConversionInput=="Celcius") {
            if(unitConversionOutput=="Fahrenheit") {
                resultConvert = Double(input) * 9.0 / 5.0 + 32.0
            }
            else if(unitConversionOutput=="Kelvin") {
                resultConvert = input + 273
            }
            else {
                resultConvert = input
            }
        }
        else if (unitConversionInput=="Fahrenheit") {
            if(unitConversionOutput=="Celcius") {
                resultConvert = (Double(input) - 32.0 ) * 5.0 / 9.0
            }
            else if(unitConversionOutput=="Kelvin") {
                resultConvert = (( Double(input) - 32 ) * 5.0 / 9.0 ) + 273
            }
            else {
                resultConvert = input
            }
        } else if (unitConversionInput=="Kelvin") {
            if(unitConversionOutput=="Celcius") {
                resultConvert = input - 273
            }
            else if(unitConversionOutput=="Fahrenheit") {
                resultConvert = ( Double(input) - 273 ) * 9.0 / 5.0 + 32
            }
            else {
                resultConvert = input
            }
        }
        return resultConvert
    }
    let unitConversions = ["Celcius", "Fahrenheit", "Kelvin"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("From", selection: $unitConversionInput) {
                        ForEach(unitConversions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    TextField("Input", value : $input, format: .number).keyboardType(.numberPad).focused($amountIsFocused)
                }
                Section {
                    Picker("To", selection: $unitConversionOutput) {
                        ForEach(unitConversions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Text(converter, format: .number)
                }
            }.navigationTitle("Temperature Converter")
        }.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Done") {
                    amountIsFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
