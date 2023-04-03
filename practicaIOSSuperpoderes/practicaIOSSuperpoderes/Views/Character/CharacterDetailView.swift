//
//  CharacterDetailView.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    
    @StateObject var viewModel: CharacterSeriesViewModel
    var character: CharacterResult
    
    var body: some View {
        NavigationStack{
            List{
                if let series = viewModel.series?.data.results {
                    ForEach(series) { serie in
                        CharacterSeriesRow(serie: serie)
                        
                        
                    }
                    
                }
            }
            .id(0)
            .navigationBarTitle("In Series: \(character.name)\(character.id)", displayMode: .inline).toolbarColorScheme(.dark, for: .navigationBar)
            
            .toolbarBackground(
                Color.blue,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct HeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(viewModel: CharacterSeriesViewModel(testing: true, id: 1), character: CharacterResult(id: 1011334, name: "3-D Man", description: "description", modified: "modi", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
                                                                                                                  comics: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: ItemType(rawValue: "")!)], returned: 1), events: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")]))
    }
}

