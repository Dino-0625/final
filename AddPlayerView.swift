//
//  AddPlayerView.swift
//  final
//
//  Created by User12 on 2021/1/8.
//

import SwiftUI
import AlertX
struct AddPlayerView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    @State var ShowAlertX = false
    @State var name: String = ""
    @State var price: String = ""
    @State var playerId : String = ""
    @State var playerURL : String = ""
    @State var playerjersey : String = ""
    @State var playerfistname : String = ""
    @State var playerlastname : String = ""
    
    @State var isFailed = false
    
    @State private var players = [TeamPlayer_]()
    func fetchPlayers() {
        let urlStr = "https://api.sportsdata.io/v3/mlb/scores/json/Players/NYY?key=a7919c9fa0184d8fade0deeb4995b717"
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
        //Text("f")
        VStack {
            List {
                ForEach(players.indices, id:\.self) { player in
                    HStack{
                        PlayerRow(player: players[player])
                        Spacer()
                        Button("加入"){
                            
                            
                            playerId = "\(players[player].PlayerID)"
                            //playerURL = players[player]!.PhotoUrl
                            playerjersey = "\(players[player].Jersey!)"
                            playerfistname = players[player].FirstName
                            playerlastname = players[player].LastName!
                            playerURL = "\(players[player].PhotoUrl!)"//String(contentsOf: players[player].PhotoUrl!)
                            
                            let isSuccessful = self.addProduct()
                            self.isFailed = !isSuccessful
                            if isSuccessful {
                            self.presentationMode.wrappedValue.dismiss()
                            }
                        }.frame(maxWidth: 40)
                        .background(Color("ButtonColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        
                    }
                        
                }
                    
            }.onAppear(perform: {
                fetchPlayers()
            })
            
                
            

            Spacer()
        }
            .navigationBarTitle("Add player")
    }

    private func addProduct() -> Bool {
        

        let product = PlayerIDDD(context: context)
        product.playerid = playerId
        //product.player_pic_url =
        product.player_jersey = playerjersey
        product.player_fname = playerfistname
        product.player_lname = playerlastname
        product.player_url = playerURL
        do {
            try context.save()
            return true
        } catch {
            print("\(error)")
            return false
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
