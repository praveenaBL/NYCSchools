//
//  ContentView.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/22/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var schoolViewModel: SchoolViewModel
    @State var filteredSchoolsList: [SchoolDataModel] = []
    @State var showProgressView = true
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $searchText)
                    if showProgressView {
                        ProgressView()
                    }
                    List {
                        ForEach(schoolsList) { school in
                            NavigationLink(destination: DetailView(schoolData: school).environmentObject(schoolViewModel), label: {
                                SchoolRowView(school: school)
                                    .listRowInsets(.init(top: 10, leading: 15, bottom: 10, trailing: 10))// removing padding on leading
                            })
                        }
                    }
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .listStyle(PlainListStyle())
                    .navigationTitle("NYC Schools List")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .task {
                do {
                    try await self.schoolViewModel.fetchNycHighSchoolsList()
                } catch {
                    print("Error in fetching NYC schools list", error)
                }
                showProgressView = false
            }
            .refreshable  { // Pull To Refresh available from iOS 15
                do {
                    try await self.schoolViewModel.fetchNycHighSchoolsList()
                } catch {
                    print("Error in fetching NYC schools list", error)
                }
                showProgressView = false
            }
        }
    }
    
    var schoolsList: [SchoolDataModel] {
        if searchText.isEmpty {
            return schoolViewModel.nycHighSchoolsList
        } else {
            return schoolViewModel.nycHighSchoolsList.filter { nycSchool in
                return nycSchool.schoolName.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(SchoolViewModel())
    }
}
