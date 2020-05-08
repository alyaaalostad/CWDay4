//
//  ContentView.swift
//  ClassWorkDay4
//
//  Created by Alyaa AlOstad on 5/7/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var weight : String =  ""
    @State var height : String =  ""
    @State var bmi : String = "0.0"
    @State var bmiStatus : String =  "-"
    var body: some View {
        VStack(alignment: .center){
            Text("Welcome to BMI Calculator")
                .font(.title)
                .bold()
            TextField("Hight in (m)", text: $height)
                .multilineTextAlignment(.center)
            TextField("weight in (kg)", text: $weight)
              .multilineTextAlignment(.center)
                .padding()
        
            Button (action: {
                self.calculateBmiAndUpdateView()
            }) {
                Text("Calculate")
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .clipShape(Capsule())
                
            }
            .padding()
            VStack(alignment: .center) {
                Text("BMI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(bmi)
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .padding()
                Text("Status")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(bmiStatus)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .padding()
            }
            
        }.padding(.all)
        
        
        
    }
    
    func calculateBmiAndUpdateView(){
        let weight = Double(self.weight) ?? 0
        let height = Double(self.height) ?? 0
        let bmi = calculateBmi(weight: weight, height: height)
        let bmiStatus = self.bmiStatus(bmi: bmi)
        self.bmi = String(format: "%.1f", bmi)
        self.bmiStatus = bmiStatus
    }

    func calculateBmi (weight: Double , height: Double) -> Double
    {
        
        weight / (height * height)
    }

    func bmiStatus (bmi: Double) -> String
    {
        switch bmi {
        case ..<20:
            return("Under Normal Weight")
        case 20..<25:
            return("Normal")
        case 25...:
            return("Above Normal Weight")
        default:
            return("ERROR!")
        }
    }

    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
