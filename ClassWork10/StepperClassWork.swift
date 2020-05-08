//
//  StepperClassWork.swift
//  ClassWorkDay4
//
//  Created by Alyaa AlOstad on 5/8/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct StepperClassWork: View {
    @State var counter = 0
    var body: some View {
        ZStack {
            BG()
            VStack{
                
                Text("ستحتاج إلى" + " \(counter * 20) " + "عدداً من الصفحات تقرأها يومياً")
                    .foregroundColor(.white)
                Stepper("كم ختمة تريد أن تختم هذا الشهر؟", value: $counter, in: 0...10)
                    .foregroundColor(.white)
                    .padding()
                HStack{
                       Text(khatmat(counter).0)
                           .foregroundColor(.white)
                           .padding()
                           .font(.largeTitle)
                        Text(khatmat(counter).1)
                            .foregroundColor(.white)
                            .padding()
                            .font(.largeTitle)
                }

                
            }
        }
    }
    
    func khatmat(_ counter: Int) -> (String, String)
      {
          switch counter {
          case 1: return ("ختمة واحدة", "")
          case 2: return ("ختمتان", "")
          case 3...10: return ("ختمات", "\(counter)")
          default: return("ختمة", "\(counter)")
          }
      }

}



struct BG: View {
    var body: some View {
        ZStack{
            Image("BACKGROUND")
                .resizable()
            
            VStack{
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                Image("Mosque")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct StepperClassWork_Previews: PreviewProvider {
    static var previews: some View {
        StepperClassWork()
    }
}
