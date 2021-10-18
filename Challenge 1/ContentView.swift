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
    
    
    var conversion: Double {
        let unitToConvert = Double(userInput) ?? 0
        
        switch (selectedValue, selectedValueTarget) {
        case (0,1):
            // c -> f
            return unitToConvert * 1.8 + 32
        case (0,2):
            // c -> k
            return unitToConvert + 273.15
        case (1,0):
            // f -> c
            return (unitToConvert - 32) * 1.8
        case (1,2):
            // f -> k
            return (unitToConvert - 32) * 1.8 + 273.15
        case (2,0):
            // k -> c
            return unitToConvert - 273.15
        case (2,1):
            // k -> f
            return (unitToConvert - 273.15) * 1.8 + 32
        default:
            return unitToConvert
        }
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Tappe le montant de degrée", text: $userInput)
                Text("Utilisateur valeur : \(userInput)")
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
                Text("Votre resultat est  \(conversion, specifier: "%g") \(convertedValues[selectedValueTarget])")
            }
        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
