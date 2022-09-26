//
//  ContentView.swift
//  iMenu
//
//  Created by Rogerio Pires on 31/08/22.
//

import SwiftUI
import Cocoa

struct ContentView: View {
    
    @StateObject private var vm: ViewModel
    @State var alertSound = false
    @State private var progress = 0.0
    @State private var date = Date()
    @State var isRunning = false
    @State var message = "Seja bem vindo"
    @StateObject private var progressCpu = SystemLoadMonitor()
  
    
    init(vm: ViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("iMenu").padding()
                Spacer()
                Image(systemName: "gear")
                    .padding()
                    .font(.system(size: 20))
            }
            
            HStack {
                
                VStack{
                    ZStack {
                        CircleView(hardware: "CPU", systemName: "cpu", percent: "90%", progress0: Double(Float(progressCpu.currentLoad)))
                    }
                }
                
                VStack {
                    ZStack {
                        CircleView(hardware: "MEM", systemName: "memorychip", percent: "60%", progress0: 0.6)
                    }
                }
                
                VStack {
                    ZStack {
                        CircleView(hardware: "DISK", systemName: "internaldrive", percent: "20%", progress0: 0.2)
                    }
                }
                
            }
            
            HStack {
                
                Text("\(progressCpu.currentLoad)")
                
                Image(systemName: "keyboard")
                    .font(.system(size: 20))
                Text("Lock Keyboard")
                Spacer()
                Toggle("", isOn: $alertSound)
                    .toggleStyle(.switch)
                    .focusable()
                
            }.padding()
            
            
            ZStack {
                HStack {
                    Image(systemName: "computermouse")
                    Text("MX Master 3")
                    Spacer()
                    BateryView(progress: $progress,
                               fill: .green,
                               outline: .black)
                    .frame(width: 50, height: 50)
                }
            }
            .padding()
            .onAppear {
                withAnimation(.interpolatingSpring(stiffness: 20.0, damping: 8.0)) {
                    self.progress = 0.7
                }
            }
            
            ///quit application
            Button(action: {
                NSApplication.shared.terminate(self)
            }) {
                Text("Quit  ⌘Q")
                    .frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
                .padding()
            
            
        }
        .frame(width: 300, height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ViewModel())
    }
}
