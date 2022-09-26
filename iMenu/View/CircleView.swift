//
//  CircleView.swift
//  iMenu
//
//  Created by Rogerio Pires on 26/09/22.
//

import SwiftUI

struct CircleView: View {
    
    var color1 = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    var color2 = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    var hardware: String
    var systemName: String
    var percent: String
    @State var progress0 = 0.0
    
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(lineWidth: 5)
                    .foregroundColor(.gray)
                    .opacity(0.1)
                    .padding(10)
                
                Circle()
                    .trim(from:0.0, to: min(progress0, 1.0))
                    .stroke(AngularGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), center: .center), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeInOut(duration: 1.0), value: progress0)
                    .padding(10)
                
                VStack(spacing: 30){
                    VStack(spacing: 3){
                        Image(systemName: systemName)
                            .opacity(0.7)
                            .font(.system(size: 20))
                        Text(hardware)
                    }
                }
            }
            Text(percent)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(hardware: "CPU", systemName: "cpu", percent: "90%", progress0: 0.9)
    }
}
