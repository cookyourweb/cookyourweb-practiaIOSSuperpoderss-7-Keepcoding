//
//  RoootView.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//




import SwiftUI

struct RootView: View {
    
    // tengo una referncia a memoria del @StateObject var rootViewModel = CharacterViewModel() de el fichero app. Por eso los viewmodels son clases y no structs para poder instanciar un viewmodel y pasar referencias de memoria a los states objects
    
    @EnvironmentObject var rootViewModel: CharacterViewModel
    
    var body: some View {
        switch rootViewModel.status{
        case .none:
            LoginView()
        case .loaded:
           PrincipalView()
        case .error(error: let errorString):
            Text("Error-> \(errorString)")
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
