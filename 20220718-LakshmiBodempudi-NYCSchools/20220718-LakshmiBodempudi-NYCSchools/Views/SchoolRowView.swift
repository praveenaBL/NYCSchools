//
//  SchoolRowView.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/24/22.
//

import SwiftUI

struct SchoolRowView: View {
    let school: SchoolDataModel
    var body: some View {
        VStack(alignment:.leading, spacing:0){
            schoolName
            schoolAddress
            phoneNumber
        }
        .contentShape(Rectangle())
    }
}

extension SchoolRowView {
    /*
     Display School Name
     */
    private var schoolName: some View {
        Text("\(school.schoolName)")
            .font(.headline)
            .foregroundColor(Color.theme.primaryTextColor)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
    }
    /*
     Display School Address
     */
    private var schoolAddress: some View {
        VStack(spacing: 0){
            HStack(alignment: .top, spacing: 8) {
                Text("Address: ")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.primaryTextColor)
                Text("\(school.primaryAddress ?? "-")), "  + "\(school.city ?? ""), " + "\(school.stateCode ?? "-"), " + "\(school.zip ?? "")")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
        .padding(.bottom, 5)
    }
    /*
     Display Phone Number
     */
    private var phoneNumber: some View {
        HStack(alignment: .top, spacing: 4) {
            Text("Phone: ")
                .font(.subheadline)
                .foregroundColor(Color.theme.primaryTextColor)
            Text("\(school.phoneNumber ?? "No Phone Number Available")")
                .font(.subheadline)
                .foregroundColor(Color.theme.secondaryText)
        }
        .padding(.bottom, 5)
    }
}
