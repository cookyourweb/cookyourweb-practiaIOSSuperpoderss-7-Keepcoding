//
//  practicaIOSSuperpoderesTests.swift
//  practicaIOSSuperpoderesTests
//
//  Created by vero on 3/4/23.
//

import XCTest
import ViewInspector
import SwiftUI
import Combine

final class practicaIOSSuperpoderesTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample()  throws {
        XCTAssertEqual(1, 1)
    }
    
    
    //test UI
    
    func testErrorView() throws {
        let view = ErrorView(error: "Testing")
            .environmentObject(CharacterViewModel())
        
        XCTAssertNotNil(view)
        
        

//        number of views  (there is only one in  this view)
        
        let numItems =  try view.inspect().count
        XCTAssertEqual(numItems, 1)
//        Error image
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        //Error text
        
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let texto = try text.text().string()
        XCTAssertEqual(texto, "Testing")
        
        // Button
        
        let boton = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(boton)
        try boton.button().tap()
        
        
    }
    
    
    func testCharacterViewRow() throws {
            let view = CharacterViewRow(character: CharacterResult(id: 1011334, name: "3-D Man", description: "description", modified: "modi", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",comics: Comics(available: 1,collectionURI: "",items: [ComicsItem(resourceURI: "", name: "")], returned: 1),series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")],returned: 1),stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "",name: "", type: ItemType(rawValue: "")!)], returned: 1),events: Comics(available: 1, collectionURI: "",items: [ComicsItem(resourceURI: "", name: "")], returned: 1),urls: [URLElement(type: URLType.comiclink, url: "")]))
            
            XCTAssertNotNil(view)
            
             // Image
            let image = try view.inspect().find(viewWithId: 0)
            XCTAssertNotNil(image)
            
            // Placeholder Image
            let placeholder = try view.inspect().find(viewWithId: 1)
            XCTAssertNotNil(placeholder)
            
            // Load Text
            let text = try view.inspect().find(viewWithId: 2)
            XCTAssertNotNil(text)
        }
    
}
