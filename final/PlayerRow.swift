//
//  DateView.swift
//  final
//
//  Created by tsui erh li on 2021/1/1.
//

import SwiftUI
import URLImage
struct PlayerRow: View {
    //let player : Detail
    var player : TeamPlayer_
    
    var body: some View {
        HStack{
            URLImage(url: player.PhotoUrl!) { image in
                image
                    .resizable()
                    .scaledToFill().frame(width:60,height:60).clipped()
            }
            
            VStack(alignment:.leading){
                if let bircountry = player.Position{
                    Text("Came from:"+bircountry )
                }
                
                if let name = player.FirstName {
                    Text("name:"+name+" "+player.LastName!)
                }
               
                
            }
            
        }
        //Text("temp")
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(player: TeamPlayer_(PlayerID: 000,PhotoUrl: URL(string:"https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/mlb/low-res/10007217.png"), BirthCountry: "垃圾場",Weight: 70 ,Height: 170, FirstName: "Dino", LastName: "Lee", Team: "Garbage", Jersey: 23, Position: "P", FanDuelName: "Mikey ")).frame(width: 200, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
