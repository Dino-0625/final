//
//  PadreView.swift
//  final
//
//  Created by tsui erh li on 2021/1/1.
//

import SwiftUI

struct PadreView: View {
    var body: some View {
        TabView{
            Main().tabItem{
                Image("SDicon").aspectRatio(contentMode: .fit)
                Text("Padres")
            }
            PlayerList().tabItem{
                Image(systemName:"book.circle")
                Text("Padres Playerlist")
            }
            Myfavorite().tabItem{
                Image(systemName:"heart.circle")
                Text("My Favorite")
            }
        }
    }
}

struct PadreView_Previews: PreviewProvider {
    static var previews: some View {
        PadreView()
    }
}
