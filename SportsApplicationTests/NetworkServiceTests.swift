//
//  NetworkServiceTests.swift
//  SportsApplicationTests
//
//  Created by Shrouk Mamdouh on 5/22/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import XCTest

@testable import SportsApplication


class NetworkServiceTests: XCTestCase {
    
    //  let networkService : SportsService = NetworkService()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    // here  testing
    
    func testLoadDataFromAPi(){
        
        // testing allsports return
        let excpection =   expectation(description: "waiting for API")
        NetworkService.loadDataFromAPi(parameterName : "", endPoint: EndPoints.allSports.rawValue, complitionHandler: {(result : AllSports?, error) in
            
            guard let items = result else{
                XCTFail()
                excpection.fulfill()
                
                return
            }; XCTAssertEqual(items.sports.count,34,"APIFailed")
            
            excpection.fulfill()
            
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLoadDataFromAPiForLeagues(){
        
        // testing leagues return
        let excpection =  expectation(description: "waiting for API")
        NetworkService.loadDataFromAPi(parameterName : "Soccer", endPoint: EndPoints.allLeagues.rawValue, complitionHandler: {(result : AllLeagues? , error) in
            
            guard let items = result else{
                XCTFail()
                excpection.fulfill()
                
                return
            }; XCTAssertEqual(items.countries.count,10,"APIFailed")
            
            excpection.fulfill()
            
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLoadDataFromAPiForTeams(){
        
        // testing teams return
        let excpection =  expectation(description: "waiting for API")
        NetworkService.loadDataFromAPi(parameterName : "English%20Premier%20League", endPoint: EndPoints.allTeamsInLeague.rawValue, complitionHandler: {(result : AllTeams?, error) in
            
            guard let items = result else{
                XCTFail()
                excpection.fulfill()
                
                return
            }; XCTAssertEqual(items.teams.count,20,"APIFailed")
            
            excpection.fulfill()
            
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLoadDataFromAPiForEvents(){
        
        // testing events return
        let excpection =      expectation(description: "waiting for API")
        NetworkService.loadDataFromAPi(parameterName : "4328", endPoint: EndPoints.allLastEventsInLeague.rawValue, complitionHandler: {(result : AllEvents? , error) in
            
            guard let items = result else{
                XCTFail()
                excpection.fulfill()
                
                return
            }; XCTAssertEqual(items.events.count,100,"APIFailed")
            
            excpection.fulfill()
            
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    
    
}
