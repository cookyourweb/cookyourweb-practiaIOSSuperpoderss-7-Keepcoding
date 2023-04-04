//
//  LoaderView.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 3/4/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        VStack{
            Image(decorative:"title")
                .resizable()
                .frame(width: 250, height: 100)
             
                
            Text("Loading ...")
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
