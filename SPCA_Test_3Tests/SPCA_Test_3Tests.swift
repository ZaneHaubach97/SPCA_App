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
    func testGetAPIKey(){
        let vm = ViewModel()
        var APIKeyresult = ""
        let expectation = self.expectation(description: "Getting API Key")
        vm.fetchToken { returnedAPIKey in
            APIKeyresult = returnedAPIKey
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertNotNil(APIKeyresult)
    }
    
    //Test to ensure the code handling the retrieval of pet JSON data and subsequent mapping into objects is working correctly.  The test is preformed using static data and ensures that the JSON data is ingested and subsequently mapped properly.
    func testAPIResponse(){
        let vm = ViewModel()
        let url = URL(string: "https://raw.githubusercontent.com/ZaneHaubach97/SPCA_App/Dev/SPCA_Test_3Tests/testPetJSON.json")!
        let request = URLRequest(url: url)
        var jsonResult: AnimalResponse?
        let expectation = self.expectation(description: "Loading Data")
        vm.fetchData(request: request){ returnedJson in
            jsonResult = returnedJson
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        let testAnimal = jsonResult?.animals[0]
        XCTAssertEqual(testAnimal?.name, "testName")
        XCTAssertEqual(testAnimal?.type, "testType")
        XCTAssertEqual(testAnimal?.species, "testSpecies")
        XCTAssertEqual(testAnimal?.breeds.primary, "testBreed")
        XCTAssertEqual(testAnimal?.age, "testAge")
        XCTAssertEqual(testAnimal?.gender, "testGender")
        XCTAssertEqual(testAnimal?.size, "testSize")
        XCTAssertEqual(testAnimal?.primary_photo_cropped?.small, "testPhoto")
        XCTAssertTrue(((testAnimal?.attributes.declawed) != nil))
        XCTAssertTrue(((testAnimal?.attributes.houseTrained) != nil))
        XCTAssertTrue(((testAnimal?.attributes.shotsCurrent) != nil))
        XCTAssertTrue(((testAnimal?.attributes.specialNeeds) != nil))
        XCTAssertTrue(((testAnimal?.attributes.spayedNeutered) != nil))
    }
    
    //Test used to check that the HTML retrieving functionality of the application works properly, this test makes a network call and then checks that the returned value is a valid HTML document.
    func testGetHTML(){
        let ev = EventViewer()
        var htmlResult = ""
        let url = "https://raw.githubusercontent.com/ZaneHaubach97/SPCA_App/Dev/SPCA_Test_3Tests/testHTML.html"
        let expectation = self.expectation(description: "Getting HTML")
        ev.getHTML(URLString: url){ returnedHTML in
            htmlResult = returnedHTML
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        print(htmlResult)
        XCTAssert(isValidHtmlString(htmlResult))
    }
    
    //Test used to ensure the HTML parsing functionality of the application is working as intended and is returning the values desired.  This test takes the sample HTML string retrieved in the test above and checks that the application is gathering the correct information and storing it properly.
    func testParseHTML(){
        let ev = EventViewer()
        let testHTML = """
            <HTML>
            <BODY BGCOLOR="FFFFFF">
                <div class ="post_text_area">
                    <img src="testImage.jpg">
                    <b>testB</b>
                    <div class ="wpb_column vc_column_container vc_col-sm-6">
                        <p>testP</p>
                    </div>
                </div>
            </BODY>
            </HTML>
        """
        let testEvents: [Event] = ev.parseHTML(html: testHTML)
        let event = testEvents[0]
        XCTAssertEqual(event.eventName, "testB")
        XCTAssertEqual(event.image, "testImage.jpg")
        XCTAssertEqual(event.details[0], "testP")
    }
    
    //Simple regex used to determine if the given string is valid HTML
    func isValidHtmlString(_ value: String) -> Bool {
        if value.isEmpty {
            return false
        }
        return (value.range(of: "<(\"[^\"]*\"|'[^']*'|[^'\">])*>", options: .regularExpression) != nil)
    }
}

//https://raw.githubusercontent.com/ZaneHaubach97/SPCA_App/Dev/SPCA_Test_3Tests/testHTML.html
//https://raw.githubusercontent.com/ZaneHaubach97/SPCA_App/Dev/SPCA_Test_3Tests/testPetJSON.json
