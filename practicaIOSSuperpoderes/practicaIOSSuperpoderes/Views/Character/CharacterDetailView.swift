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
            .navigationBarTitle("Series \(character.name)\(character.id)", displayMode: .inline)
           
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(viewModel: CharacterSeriesViewModel(testing: true, id: 1), character: CharacterResult(id: 1, name: "3-D Man", description: "mockup hero", modified: "014-04-29T14:18:17-0400014-04-29T14:18:17-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: ItemType(rawValue: "")!)], returned: 1), events: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")]))
    }
}

