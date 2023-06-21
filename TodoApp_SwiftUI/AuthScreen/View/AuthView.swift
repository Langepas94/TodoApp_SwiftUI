//
//  AuthView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // MARK: - Header
                
                HeaderAuthView(title: "ToDo", subtitle: "Get all things done", angle: 15, backgroundColor: .pink)
                
                // MARK: - Login
                Form {
    
//                    if !viewModel.errorMessage.isEmpty {
//                        Text(viewModel.errorMessage)
//                            .foregroundColor(.red)
//                            .listRowSeparator(.hidden)
//                    }
                    Text(viewModel.errorMessage)
                        .listRowSeparator(.hidden)
                        .foregroundColor(.red)
                    
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.roundedBorder)
                        .listRowSeparator(.hidden)

                    ButtonHelperView(title: "Log in", backgroundColor: .blue, action: {
                        viewModel.login()
                    })
                    
                }
                .offset(y: -50)

                // MARK: - Create an Account

                VStack {
                    Text("New around here?")

                    NavigationLink("Create an account", destination: RegisterView())

                }
                .padding(.bottom, 50)
//
                Spacer()
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
