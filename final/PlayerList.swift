//
//  PlayerList.swift
//  final
//
//  Created by User02 on 2020/12/28.
//

import SwiftUI

struct PlayerList: View {
    
    
    @State private var players = [TeamPlayer_]()
    func fetchPlayers() {
        let urlStr = "https://api.sportsdata.io/v3/mlb/scores/json/Players/SD?key=a7919c9fa0184d8fade0deeb4995b717"
        if let url = URL(string: urlStr) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                  if let data = data {
                     do {
                        let temp = try JSONDecoder().decode([TeamPlayer_].self, from: data)
                        print(temp)
                        players=temp
                     } catch {
                        print(error)
                     }
                  }
               }
            task.resume()
        }
    }
    
    
    
    var body: some View {
        NavigationView{
            
                
                VStack{
                    
                    List(players.indices, id:\.self, rowContent: { (index) in
        
                        NavigationLink(destination:PlayerDetailView(playerID: players[index].PlayerID, playerr: players[index]),
                                       label:{
                                        PlayerRow(player: players[index])
                                        
                                       })
                        
                        //Text(players[index].FirstName)
                        
                    })
                    .onAppear(perform: {
                        fetchPlayers()
                })
                    
                }.frame(width:380).background(Image("mlb").resizable().scaledToFill().frame(width:395,height:800).clipped().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)).onAppear(perform: {
                    fetchPlayers()
                }).navigationBarTitle("四十人名單")
            
        }
        
        
        
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList()
    }
}
/*if(player != nil){
    Text(player!.birth_country)
}
else {
    Text("ddd")
}*/
