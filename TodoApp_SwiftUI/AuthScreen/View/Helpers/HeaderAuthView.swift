//
//  HeaderAuthView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct HeaderAuthView: View {
    var body: some View {
        VStack {
            
// MARK: - Header Settings
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.pink)
                    .rotationEffect(Angle(degrees: 15 ))
                
                VStack {
                    Text("ToDo")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text("Get all things done")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 30)
            }
            .frame(width: UIScreen.main.bounds.width * 2, height: 300)
            .offset(y: -100)
        }
    }
}

struct HeaderAuthView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAuthView()
    }
}
