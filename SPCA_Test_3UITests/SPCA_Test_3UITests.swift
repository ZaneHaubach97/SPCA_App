//
//  SPCA_Test_3UITests.swift
//  SPCA_Test_3UITests
//
//  Created by Zane Haubach on 4/12/22.
//

import XCTest

class SPCA_Test_3UITests: XCTestCase {

    //print(XCUIApplication().debugDescription)
    
    
    //test function designed to ensure that the donate button takes the user to the correct website page on the Winchester SPCA website.
    func testDonateButton(){
        let app = XCUIApplication()
        app.launch()
        sleep(2)
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        
        let donateLink = app.buttons["showDonateScreen"]
        donateLink.press(forDuration: 0.1)
        
        safari.wait(for: .runningForeground, timeout: 10)
        safari.textFields["Address"].tap()
        let val = safari.textFields["Address"].value as! String
        
        XCTAssertEqual(val, "https://winchesterspca.org/donate/")
        app.activate()
    }
    
    //test function designed to ensure the filter menu is displayed when the filter menu button is pressed
    func testFilterButton(){
        let app = XCUIApplication()
        app.launch()
        sleep(2)

        let filterButton = app.buttons["filterButton"]
        filterButton.tap()
        
        
        print(XCUIApplication().debugDescription)

        let filterMenuLabel = app.staticTexts["petView"]
        XCTAssert(filterMenuLabel.waitForExistence(timeout: 5.0))
    }
    
    //test function designed to ensure the bottom bar is working as intended and displays the appropriate views when selected.
    func testBottomBar(){
        let app = XCUIApplication()
        app.launch()
        sleep(2)
        
        //testing that when the event view is selected from the bottom bar it displays
        app.tabBars.buttons.element(boundBy: 1).tap()
        print(XCUIApplication().debugDescription)
        let eventsView  = app.staticTexts["eventNameText"] // check that events page has loaded
        XCTAssert(eventsView.waitForExistence(timeout: 5.0))
        
        //testing that when the services view is selected from the bottom bar it displays
        app.tabBars.buttons.element(boundBy: 2).tap()
        let servicesView  = app.staticTexts["serviceNameText"] // check that services page has loaded
        XCTAssert(servicesView.waitForExistence(timeout: 5.0))
        
        //testing that when the pet view is selected from the bottom bar it displays
        app.tabBars.buttons.element(boundBy: 0).tap()
        let petsView  = app.staticTexts["petNameText"] // check that pets page has loaded
        XCTAssert(petsView.waitForExistence(timeout: 5.0))
    }
    
    func testPetDetailView(){
        let app = XCUIApplication()
        app.launch()
        sleep(2)
        
        print(XCUIApplication().debugDescription)
        
        let tapPet = app.buttons["tapPet"].firstMatch
        tapPet.tap()
        
        let petDetailView = app.staticTexts["animalNameText"]
        XCTAssert(petDetailView.waitForExistence(timeout: 1.0))
    }

}
