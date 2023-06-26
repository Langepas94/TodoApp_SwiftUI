//
//  ButtonHelperView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct ButtonHelperView: View {
    
    // MARK: - public properties
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(backgroundColor)

                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct ButtonHelperView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonHelperView(title: "Log in", backgroundColor: .blue) {
            //
        }
    }
}
