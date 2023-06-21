//
//  AuthView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // MARK: - Header
                
                HeaderAuthView(title: "ToDo", subtitle: "Get all things done", angle: 15, backgroundColor: .pink)
                
                // MARK: - Login
                Form {
                    Spacer().listRowSeparator(.hidden)
                    TextField("Email address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .listRowSeparator(.hidden)

                    ButtonHelperView(title: "Log in", backgroundColor: .blue, action: {
                        //
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
