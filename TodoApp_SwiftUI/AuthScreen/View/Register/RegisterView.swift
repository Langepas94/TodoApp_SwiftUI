//
//  RegisterView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct RegisterView: View {
    
    // MARK: - propeties
    
    @StateObject var viewModel = RegisterViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            HeaderAuthView(title: "Register", subtitle: "Start organizing with us", angle: -15, backgroundColor: .yellow)
            
            // MARK: Registration form ui
            
            Form {
                Text(viewModel.errorMessage)
                    .listRowSeparator(.hidden)
                    .foregroundColor(.red)
                
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(.automatic)
                    .autocorrectionDisabled()
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.automatic)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                
                ButtonHelperView(title: "Register", backgroundColor: .teal, action: {
                    viewModel.register()
                })
            }
            .offset(y: -50)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
