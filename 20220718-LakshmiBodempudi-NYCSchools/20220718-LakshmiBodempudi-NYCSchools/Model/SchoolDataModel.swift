//
//  SchoolDataModel.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/24/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct SchoolDataModel: Identifiable, Codable {
    var id = UUID()
    var dbn, schoolName, schoolOverview: String
    var phoneNumber, email, website: String?
    var totalStudents: String?
    var primaryAddress,city, zip, stateCode: String?
    var latitude, longitude: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case schoolOverview = "overview_paragraph"
        case phoneNumber = "phone_number"
        case email = "school_email"
        case website
        case totalStudents = "total_students"
        case primaryAddress = "primary_address_line_1"
        case city, zip
        case stateCode = "state_code"
        case latitude,longitude
    }
    
}


   
