//
//  BaseNetwork.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

//

//

import Foundation

let server = "https://gateway.marvel.com"
var idHero: Int = 0
//Server-side applications must pass two parameters in addition to the apikey parameter:
//
//public key= apikey 0621519d3830d5ff6ccadacd381be830
//private key c5d79fecff17958d7f42583db4077d31df9e90ec
//ts = 1
//hash
//the hash value is the md5 digest of 1privatekeypublickey (www.md5hashgenerator.com)= 65e2744e93d5e85d0c7d21db818b7e1a
// https //gateway.marvel.com/v1/public/comics?ts=1&apikey=0621519d3830d5ff6ccadacd381be830&hash=65e2744e93d5e85d0c7d21db818b7e1a
//Server-side applications must pass two parameters in addition to the apikey parameter:
//
//public key= apikey 0621519d3830d5ff6ccadacd381be830
//private key c5d79fecff17958d7f42583db4077d31df9e90ec
//ts = 1
//hash
//the hash value is the md5 digest of 1privatekeypublickey (www.md5hashgenerator.com)= 65e2744e93d5e85d0c7d21db818b7e1a
// https //gateway.marvel.com/v1/public/comics?ts=1&apikey=0621519d3830d5ff6ccadacd381be830&hash=65e2744e93d5e85d0c7d21db818b7e1a


struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints: String{
    case charactersList = "/v1/public/characters"
    case characterSeriesList = "/series"
}

enum params: String {
    case apikey = "0621519d3830d5ff6ccadacd381be830"
    case ts = "1"
    case hashs = "65e2744e93d5e85d0c7d21db818b7e1a"
    case orderBy = "name"
    case limit = "100"
    
}

struct BaseNetwork{
    
    
    // Url getSessionCharacters
    
    func getSessionCharactersSeries(id: Int) -> URLRequest {
        let urlCad: String = "\(server)\(endpoints.charactersList.rawValue)/\(id)\(endpoints.characterSeriesList.rawValue)"
        
        

        
        var urlComponents = URLComponents(url: URL(string: urlCad)!, resolvingAgainstBaseURL: true)
        

        let queryItems = [
            URLQueryItem(name: "apikey", value: "\(params.apikey.rawValue)"),
            URLQueryItem(name: "ts", value: "\(params.ts.rawValue)"),
            URLQueryItem(name: "hash", value: "\(params.hashs.rawValue)"),
        

        ]
        urlComponents?.queryItems = queryItems
        
        var urlRequest: URLRequest?
        
        if let urlWithParams = urlComponents?.url{
            // Creo la request
            var request = URLRequest(url: urlWithParams)
            request.httpMethod = HTTPMethods.get
            request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
            
            urlRequest = request
            
        } else {
            urlRequest = URLRequest(url: URL(string: "")!)
        }
        
        return urlRequest!
 
    }
    
    
    // Urll get Session characters
    
    func getSessionnCharacters(filter: String) -> URLRequest {
        let urlCad: String = "\(server)\(endpoints.charactersList.rawValue)"
        
        var urlComponents = URLComponents(url: URL(string: urlCad)!, resolvingAgainstBaseURL: true)
        

        let queryItems = [
            URLQueryItem(name: "apikey", value: "\(params.apikey.rawValue)"),
            URLQueryItem(name: "ts", value: "\(params.ts.rawValue)"),
            URLQueryItem(name: "hash", value: "\(params.hashs.rawValue)"),
            URLQueryItem(name: "orderBy", value: "\(params.orderBy.rawValue)"),
            URLQueryItem(name: "limit", value: "50"),

            filter == "" ? nil : URLQueryItem(name: "nameStartsWith", value: "\(filter)")
            
        ].compactMap { $0 }

        urlComponents?.queryItems = queryItems
        
        var urlRequest: URLRequest?
        
        if let urlWithParams = urlComponents?.url{
        
            var request = URLRequest(url: urlWithParams)
            request.httpMethod = HTTPMethods.get
            request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
            
            urlRequest = request
            
        } else {
            urlRequest = URLRequest(url: URL(string: "bad request")!)
        }
        
        return urlRequest!
 
    }
    
    
}

