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
        
        NavigationView {
            VStack {
                // MARK: - Header
                HeaderAuthView()
                
                // MARK: - Login
                Form {
                    TextField("Email address", text: $email)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .listRowSeparator(.hidden)
                    
                    Button {
                        //
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color.blue)
                            
                            Text("Log in")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                
                // MARK: - Create an Account
                
                VStack {
                    Text("New around here?")
                    
                   NavigationLink("Create an account", destination: RegisterView())
                    .padding(.bottom, 40)
                }
                
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
