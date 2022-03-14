//
//  SPCA_Test_3Tests.swift
//  SPCA_Test_3Tests
//
//  Created by Zane Haubach on 3/10/22.
//

import XCTest

@testable import SPCA_Test_3

class SPCA_Test_3Tests: XCTestCase {
    
    //Test to ensure API call to retrieve API key returns a value, as the key can be any alphanumeric combination it is only tested to be not nil
    /*func testGetAPIKey(){
        let vm = ViewModel()
        let result: () = vm.fetchToken()
        XCTAssertNotNil(result)
    }*/

    func testAPIResponse(){
        let vm = ViewModel()
        var testAnimals: [Animal] = []
        
        
        let expectation = expectation(description: "Loading Animals")
        vm.fetchToken()
        expectation.fulfill()
        waitForExpectations(timeout: 10)
        testAnimals = vm.animals
    }

}


/*func testStoryLoading() throws {
 let parser = FeedParser()

 // create the expectation
 let exp = expectation(description: "Loading stories")

 // call my asynchronous method
 parser.loadStories {
     // when it finishes, mark my expectation as being fulfilled
     exp.fulfill()
 }

 // wait three seconds for all outstanding expectations to be fulfilled
 waitForExpectations(timeout: 3)

 // our expectation has been fulfilled, so we can check the result is correct
 XCTAssertEqual(parser.stories.count, 20, "We should have loaded exactly 20 stories.")
}*/
