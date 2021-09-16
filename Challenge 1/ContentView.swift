//
//  ContentView.swift
//  Challenge 1
//
//  Created by Giovanni Gaffé on 2021/9/16.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var convertMesure = ""
    @State private var resultOutput = ""
    
    @State private var selectedValue = 1
    @State private var selectedValueTarget = 1

    let convertedValues = ["Celcius", "Fahrenheit", "Kelvin"]
    
    var getTemperature: Double {
        let userInput = Double(userInput) ?? 0
        let selectValue = convertedValues[selectedValue]
        let selectedValueTarget = convertedValues[selectedValueTarget]
        
        
        return 0
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Hello, world!", text: $userInput)
                Text("User input : \(userInput)")
            }
            
            Section {
                Picker("selectedValue", selection: $selectedValue) {
                    ForEach(0 ..< convertedValues.count) {
                        Text("\(self.convertedValues[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                Picker("selectedValue", selection: $selectedValueTarget) {
                    ForEach(0 ..< convertedValues.count) {
                        Text("\(self.convertedValues[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                Text("Your conversion is \(getTemperature, specifier: "%.2f") \(convertedValues[selectedValueTarget])")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
