//
//  MainView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct MainSuperView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
                TodoMainListView()
            } else {
                
                AuthView()
                
            }
           
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainSuperView()
    }
}
