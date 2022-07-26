//
//  SchoolSatScoreDataModel.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/24/22.
//

import Foundation

// MARK: - SchoolSatScoreDataModel
struct SchoolSatScoreDataModel: Codable {
    var id = UUID()
    var dbn: String
    var schoolName, numOfSatTestTakers, readingAvgScore: String?
    var mathAvgScore, writingAvgScore: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case readingAvgScore = "sat_critical_reading_avg_score"
        case mathAvgScore = "sat_math_avg_score"
        case writingAvgScore = "sat_writing_avg_score"
    }
    
    init(dbn: String){
        self.dbn = dbn
    }
}

