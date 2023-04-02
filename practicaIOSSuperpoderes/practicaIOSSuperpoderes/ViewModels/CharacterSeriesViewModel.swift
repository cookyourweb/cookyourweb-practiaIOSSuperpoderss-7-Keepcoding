//
//  CharacterSeriesViewModel.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

import Foundation
import Combine


final class CharacterSeriesViewModel: ObservableObject{
    
    @Published var series:  MarvelCharacterSeriesModel?
        @Published var status = Status.none
        
        
        
        var suscriptors = Set<AnyCancellable>()

        public init(testing: Bool = false, id: Int){
            
            if(testing){
               getCharactersSeriesTesting()
            }else{
                getCharactersSeries(id: id)
            }
        }
        
        func getCharactersSeries(id: Int){
            self.status = .loading
            URLSession.shared.dataTaskPublisher(for: BaseNetwork()
                .getSessionCharactersSeries(id: id))
                .tryMap{
                    guard let response = $0.response as? HTTPURLResponse,
                          response.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return $0.data
                }
                .decode(type: MarvelCharacterSeriesModel.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion{
                    case .failure:
                        self.status = Status.error(error: "Search Characters error")
                    case .finished:
                        self.status = .loaded
                    }
                } receiveValue: { data in
                    self.series = data
                }
                .store(in: &suscriptors)
                

        }
        
        func getCharactersSeriesTesting(){
            
        }
    
}
