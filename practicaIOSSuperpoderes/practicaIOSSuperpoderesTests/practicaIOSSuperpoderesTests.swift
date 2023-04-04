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
    
    
    //Models Testing
    
    //    MarvelCharacters Model Testing
    func testModels() throws {
        let character = CharacterResult(id: 1, name: "Hulk", description: "Test", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), series: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: ItemType(rawValue: "")!)], returned: 1), events: Comics(available: 1, collectionURI: "", items: [ComicsItem(resourceURI: "", name: "")], returned: 1), urls: [URLElement(type: URLType.comiclink, url: "")])
        
        XCTAssertNotNil(character)
        XCTAssertEqual(character.name, "Hulk")
        XCTAssertEqual(character.description, "Test")
        XCTAssertEqual(character.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
        XCTAssertEqual(character.thumbnail.thumbnailExtension, "jpg")
        
        
        
    }
    
    //    Combine Testing( se hace un testing para una llamada de red. En la realidad nunca se hace, tendríamos  que crear protocolos. Ya que hay contraseñas y seguridad de por medio que es testeable)
    
    
    func testCharacterViewModel() throws {
        //Suscriptor
        var suscriptor = Set<AnyCancellable>()
        
        let expectation = self.expectation(description: "Get characters")
        
        let vm = CharacterViewModel(testing: true)
        XCTAssertNotNil(vm)
        
        // y Observador
        vm.characters.publisher
            .sink { completion in
                switch completion{
                case.finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case.failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
            }
            .store(in: &suscriptor)
        
        //vm.getCharacters(filter: "")
        vm.getCharactersTesting()
        
        self.waitForExpectations(timeout: 10)//espera 10 sg al expectation
        
    }
    
    
    //    testing del interactor de viewmodel de characters como tendríamos que hacerlo . ya que en el viewmodel se puede hacer la inyeccion de dependencias de otro sitio.
    //    NetworkedProtocol
    
    //todo
//    func testCharacterLoad() throws {}
       
        
    
}
