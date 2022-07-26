//
//  DetailView.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/25/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var schoolViewModel: SchoolViewModel
    @State var satScore = SchoolSatScoreDataModel(dbn: "")
    var schoolData: SchoolDataModel
    @State var showProgressView = true
    
    var body: some View {
        ZStack {
            ScrollView {
                if showProgressView {
                    ProgressView()
                }
                VStack(alignment: .leading) {
                    schoolName
                    if satScore.dbn.isEmpty {
                        satDetailsEmptyText
                    }  else {
                        satDetails
                    }
                    Divider()
                    Spacer()
                    overViewDetails
                    Divider()
                    Spacer()
                    webDetails
                }
            }
            .navigationTitle("School Details")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                do {
                    try await self.schoolViewModel.fetchSatData()
                    getSatScore()
                } catch {
                    print("Error in fetching SAT Score", error)
                }
                showProgressView = false
        }
        }
    }
    /*
    Function returns SAT Score details for the selected school by checking dbn value
     */
    func getSatScore() {
        for score in schoolViewModel.nycHighSchoolsSatScore {
            if score.dbn == schoolData.dbn {
                satScore = score
                return
            }
        }
    }
}
/*
 Method to change navigation appearance
 */
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

extension DetailView {
    /*
     Display School Name
     */
    private var schoolName: some View {
        Text(schoolData.schoolName )
            .font(.headline)
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding(.leading, 10)
    }
    /*
     Display NO DETAILS text when SAT details are not available
     */
    private var satDetailsEmptyText: some View {
        Text(Constants.noSATDetailsAvailable)
            .font(.callout)
            .foregroundColor(Color.theme.accent)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .padding(50)
    }
    /*
     Display SAT details
     */
    private var satDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Number of SAT Test Takers : " + (satScore.numOfSatTestTakers ?? Constants.noTestTakers) )
            Text("Average Reading Score : " + (satScore.readingAvgScore ?? Constants.noDataAvailable) )
            Text("Average Writing Score : " + (satScore.writingAvgScore ?? Constants.noDataAvailable) )
            Text("Average Writing Score : " + (satScore.mathAvgScore ?? Constants.noDataAvailable) )
        }
        .font(.subheadline)
        .padding()
    }
    
    /*
     Display School overview
     */
    private var overViewDetails: some View {
        VStack {
            Text("Overview")
                .font(.headline)
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.leading,.top], 10)
            Text(schoolData.schoolOverview)
                .font(.subheadline)
                .frame(maxWidth:.infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.secondary)
                .padding()
        }
    }
    
    /*
     Display Email and Website details
     */
    private var webDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Email : " + (schoolData.email ?? Constants.noEmailDetails) )
            Text("Website : " + (schoolData.website ?? Constants.noWebsiteDetails) )
        }
        .font(.subheadline)
        .padding()
    }
}


