//
//  RoootView.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//




import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var rootViewModel: CharacterViewModel
    
    var body: some View {
        switch rootViewModel.status{
        case .none:
            LoginView()
        case .loaded:
           PrincipalView()
        case .error(error: _):
            Text("Error")
        case .loading:
            Text("Loading")
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CharacterViewModel())
    }
}
