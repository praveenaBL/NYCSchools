//
//  _0220718_LakshmiBodempudi_NYCSchoolsApp.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/22/22.
//

import SwiftUI

@main
struct _0220718_LakshmiBodempudi_NYCSchoolsApp: App {
    
    @StateObject private var schoolViewModel = SchoolViewModel()
    @State private var showLaunchView: Bool = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                       .navigationBarHidden(true)// hiding default navigation view
                }
                .navigationViewStyle(StackNavigationViewStyle())// This will force iPad navigation similar to iPhone instead of split
                .environmentObject(schoolViewModel)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
                
            }
            
        }
    }
}
