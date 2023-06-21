//
//  MainView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct MainSuperView: View {
    var body: some View {
        NavigationView {
            AuthView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainSuperView()
    }
}
