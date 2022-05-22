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
        
     let excpection =      expectation(description: "waiting for API")
        NetworkService.loadDataFromAPi(parameterName : "", endPoint: EndPoints.allSports.rawValue, complitionHandler: {(result : AllSports?) in
            
            guard let items = result else{
                XCTFail()
                excpection.fulfill()
                
                return
            }; XCTAssertEqual(items.sports.count,34,"APIFailed")
            
            excpection.fulfill()
            
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    

}
