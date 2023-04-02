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
                    .cornerRadius(10)
                    .opacity(0.7)
                    .shadow(radius: 10, x: 10, y: 20)
                    .id(0)
                    
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .id(1)
                
                
            }
            
            Text(character.name)
                .font(.title)
                .bold()
                .id(2)
            
                

        }
        
        
    }
}



struct CharacterViewRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterViewRow(character: CharacterResult(id: 1011334, name: "3-D Man", description: "Mockup Character", modified: "2014-04-29T14:18:17-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334", comics: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")], returned: 1), stories: Stories(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017100/stories", items: [StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/92078", name: "Hulk (2008) #55", type: ItemType(rawValue: "Cover")!)], returned: 1), events: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1010699/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/40776", name: "Dark Avengers (2012) #177")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")]))
    }
}
