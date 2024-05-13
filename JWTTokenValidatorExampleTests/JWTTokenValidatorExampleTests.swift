//
//  JWTTokenValidatorExampleTests.swift
//  JWTTokenValidatorExampleTests
//
//  Created by Thomas (privat) Leonhardt on 10.05.24.
//

import Combine
import XCTest
@testable import JWTTokenValidatorExample

final class JWTTokenValidatorExampleTests: XCTestCase {
    let sut = JWTTokenValidatorViewModel(key: "MY - KEY")
    let payload = PayloadModel(url: "google.com", exp: .init(value: .distantFuture))
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_GivenSUT_WhenPayloadIsValid_ThenTokenIsNotNil() throws {
        let expectation = expectation(description: "Expectation")
        
        sut.$token
            .dropFirst()
            .sink { token in
                // THEN
                XCTAssertNotNil(token)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        // WHEN
        sut.createToken(payload: payload, digestAlgorithm: .sha256)
        
        wait(for: [expectation], timeout: 3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
