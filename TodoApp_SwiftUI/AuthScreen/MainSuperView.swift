//
//  MainView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct MainSuperView: View {
    
    // MARK: - public properties
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            accountView
        } else {
            AuthView()
        }
    }
    
    // MARK: - account viewbuilder
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoMainListView(userID: viewModel.currentUserID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainSuperView()
    }
}
