//
//  HeaderAuthView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct HeaderAuthView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
            
// MARK: - Header Settings
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(backgroundColor)
                    .rotationEffect(Angle(degrees: angle))
                
                VStack {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 80)
            }
            .frame(width: UIScreen.main.bounds.width * 2, height: 350)
            .offset(y: -150)
    }
}

struct HeaderAuthView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAuthView(title: "Title", subtitle: "Subtititle", angle: 15, backgroundColor: Color.pink)
    }
}
