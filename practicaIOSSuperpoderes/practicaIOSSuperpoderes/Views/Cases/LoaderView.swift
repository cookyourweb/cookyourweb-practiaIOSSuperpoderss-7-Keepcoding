//
//  LoaderView.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 4/4/23.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var animationAmount = 0.1
    @State private var animate = false
    
    var body: some View {
        VStack{
            Image(decorative: "title")
                .resizable()
                .frame(width: 200, height: 100)
                .scaleEffect(animationAmount)
                .animation(.easeInOut(duration: 1).repeatForever().repeatForever(autoreverses: true), value: animationAmount)
                .onAppear{
                    animationAmount = 1
                }
            
            Text("Cargando...")
                .font(.title)
                .foregroundColor(.red)
               
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
