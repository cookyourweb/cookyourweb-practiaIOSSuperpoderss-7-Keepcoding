//
//  CharacterViewRow.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

import SwiftUI

struct CharacterViewRow: View {
    @Environment(\.colorScheme)
    var colorScheme

    var character: CharacterResult
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .id(0)
                    
            } placeholder: {
                Image(systemName: "title")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .id(1)
                
                
            }
            
            Text(character.name)
                .font(.title)
                .bold()
                .foregroundColor(.blue)
                .id(2)
            
                

        }
        
        
    }
}



struct CharacterViewRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterViewRow(character: CharacterResult(id: 1011334, name: "3-D Man", description: "description", modified: "modi", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",comics: Comics(available: 1,collectionURI: "",items: [ComicsItem(resourceURI: "", name: "")], returned: 1),series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")],returned: 1),stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "",name: "", type: ItemType(rawValue: "")!)], returned: 1),events: Comics(available: 1, collectionURI: "",items: [ComicsItem(resourceURI: "", name: "")], returned: 1),urls: [URLElement(type: URLType.comiclink, url: "")]))
        
        
        
        
        
    }
}
