//
//
//  PrincipalView.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

import SwiftUI

struct PrincipalView: View {
    
    @State private var selection = 0
       @EnvironmentObject var rootviewModel: CharacterViewModel
       
       var body: some View {
           
           ZStack {
            
            
           
           TabView(selection: $selection){
                           //Tab1
                           CharacterView(viewModel: CharacterViewModel())
                               .tabItem {
                                   Image(systemName: "house")
                                   Text("Inicio")
                               }.tag(0)
                           
                           //Tab2
                           
                          /* DevelopersView(viewModel: CharacterSeriesViewModel())
                               .tabItem {
                                   Image(systemName: "person")
                                   Text("keepcoders")
                               }.tag(1)
                           
                           

                               */
                           }
                           .tabItem {
                                   Image(systemName: "gear")
                                   Text("Config")
                               }.tag(2)
                       }
                       
    
  
   
       
    }
}

struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalView()
            .environmentObject(CharacterViewModel())
    }
}

