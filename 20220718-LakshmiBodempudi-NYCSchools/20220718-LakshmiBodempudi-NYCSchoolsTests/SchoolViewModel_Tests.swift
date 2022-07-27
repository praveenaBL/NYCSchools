//
//  SchoolViewModel_Tests.swift
//  20220718-LakshmiBodempudi-NYCSchoolsTests
//
//  Created by Lakshmi Praveena Bodempudi on 7/27/22.
//

import XCTest
@testable import _0220718_LakshmiBodempudi_NYCSchools

class SchoolViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SchoolViewModel_FetchNycHighSchoolsList_notNil() async throws {
        let testSchoolListViewModel = await SchoolViewModel()
        let schoolsList: () = try await testSchoolListViewModel.fetchNycHighSchoolsList()
        XCTAssertNotNil(schoolsList)
    }
    
    func test_SchoolViewModel_fetchSatData_notNil() async throws {
        let testSchoolListViewModel = await SchoolViewModel()
        let schoolSATData: () = try await testSchoolListViewModel.fetchSatData()
        XCTAssertNotNil(schoolSATData)
    }

}
