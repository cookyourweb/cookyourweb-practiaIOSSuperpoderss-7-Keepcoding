//
//  MarvelCharacterSeriesModel.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

import Foundation

// MARK: - MarvelCharacterSeries

struct MarvelCharacterSeriesModel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: SeriesClass
}

// MARK: - DataClass
struct SeriesClass: Codable {
    let offset, limit, total, count: Int
    let results: [CharacterSeriesResult]
}

// MARK: - Result
struct CharacterSeriesResult: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    //let resourceURI: String
   // let urls: [URLElement]
    //let startYear, endYear: Int
    //let rating, type: String
  //  let modified: Date
    let thumbnail: Thumbnail
    //let creators: Creators
    //let characters: Characters
   // let stories: Stories
   // let comics, events: Characters
//    let next, previous: Next?
    
    
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersItem]
    let returned: Int
}

// MARK: - CharactersItem
struct CharactersItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name, role: String
}


enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}



