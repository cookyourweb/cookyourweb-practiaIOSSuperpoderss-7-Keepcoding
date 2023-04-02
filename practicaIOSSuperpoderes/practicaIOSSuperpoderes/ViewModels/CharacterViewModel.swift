//
//  CharacterViewModel.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

import Foundation

import Combine

final class CharacterViewModel: ObservableObject {
    @Published var characters: MarvelCharacterModel?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()

    init(testing: Bool = false){
        if(testing){
            getCharactersTesting()
        }else{
            getCharacters(filter: "")
        }
    }
    
    func getCharacters(filter: String){
        self.status = .loading
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getSessionnCharacters(filter: filter))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelCharacterModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error getting Characters")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
                self.characters =  data
            }
            .store(in: &suscriptors)
            

    }
    
    func getCharactersTesting(){
     
        
    }
}
