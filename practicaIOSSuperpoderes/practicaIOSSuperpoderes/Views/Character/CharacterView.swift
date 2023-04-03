//
//  CharacterView.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

import SwiftUI

struct CharacterView: View {
    
    
    @StateObject var viewModel: CharacterViewModel
    @State private var filter = ""
    
    var body: some View {
        
        NavigationStack{
            
            
            List{
                if let characters = viewModel.characters?.data.results{
                    
                    ForEach(characters){
                        character in
                        
                        NavigationLink{
                            CharacterDetailView(viewModel: CharacterSeriesViewModel(id:character.id), character: character)
                        }
                    label: {
                        CharacterViewRow(character: character)
                        
                    }
                        
                        
                    }
                }
            }
            .id(0)
            .searchable(text: $filter, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by name")
            .onChange(of: filter) { newValue in
                viewModel.getCharacters(filter: newValue)
            }
            .navigationTitle("Marvel Characters").toolbarColorScheme(.dark, for: .navigationBar)
            
            .toolbarBackground(
                Color.blue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        
    }
    
    
    
    
    struct CharacterView_Previews: PreviewProvider {
        static var previews: some View {
            CharacterView(viewModel: CharacterViewModel(testing: false))
        }
    }
}
