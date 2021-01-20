//
//  PlayerDetailView.swift
//  final
//
//  Created by User02 on 2020/12/28.
//

import SwiftUI
import URLImage
import CoreData



struct PlayerDetailView: View {
    @State private var offset = CGSize.zero
    @State private var newPosition = CGSize.zero
    @State private var scale: CGFloat = 1
    @State private var newScale: CGFloat = 1
    @State private var degrees: Double = 0
    var playerID : Int
    var playerr : TeamPlayer_
    @State private var player : PlayerStat?
   
    var urrrl = "https://api.sportsdata.io/v3/mlb/stats/json/PlayerSeasonStatsByPlayer/2020/"//find player detail stats
    var apikey = "a7919c9fa0184d8fade0deeb4995b717"
    
    func fetchPlayers() {
        //let urlStr = urrrl + "\(playerID)" + "?key=" + apikey
        let urlStr = "https://api.sportsdata.io/v3/mlb/stats/json/HitterVsPitcher/10007217/10007217?key=a7919c9fa0184d8fade0deeb4995b717"
        if let url = URL(string: urlStr) {
            
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                  if let data = data {
                     do {
                        let temp = try JSONDecoder().decode([PlayerStat].self, from: data)
                        print(temp)
                        player=temp[0]
                        
                     } catch {
                        print(error)
                     }
                  }
               }
            task.resume()
        }
    }
    var body: some View {
        
        ZStack {
            Image("Stadium").resizable().scaledToFill().frame(width:395,height:800).clipped().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
               
                URLImage(url: playerr.PhotoUrl!) { image in
                    image
                        .resizable()
                        .scaledToFill().frame(width:150,height:150).clipped()
                }.background(Image("mitsai")
                 .resizable()
                 .frame(width:50,height:50))
                 .offset(offset)
                 .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                        offset = CGSize(width: value.translation.width + newPosition.width,
                        height: value.translation.height + newPosition.height)
                        })
                        .onEnded({ (value) in
                        newPosition = offset
                        })
                )
                .rotationEffect(Angle.degrees(degrees))
                    .gesture(RotationGesture()
                    .onChanged { angel in
                    degrees = angel.degrees
                    })
                
                if let playerrr = playerr {
                    VStack(alignment: .leading) {
                        Text("出生地："+playerrr.BirthCountry!)
                        Text("體重："+"\(playerrr.Weight!)")
                        Text("身高："+"\(playerrr.Height!)")
                        Text("球隊："+playerrr.Team!)
                        Text("背號："+"\(playerrr.Jersey!)")
                        Text("守備位置:"+playerrr.Position!)
                        Text("")
                        
                    }.foregroundColor(.black).font(.title)
                }
                
            }.onAppear(perform: {
                fetchPlayers()
        })
        }
    }
}

/*let PlayerID : Int
let PhotoUrl : URL?
let BirthCountry : String?
//let Weight : String
let Height : Int?
let FirstName : String
let LastName : String?
let Team : String?
let Jersey : Int?
let Position : String?
let FanDuelName: String?*/

struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView(playerID:1234534,playerr: TeamPlayer_(PlayerID: 000,PhotoUrl: URL(string:"https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/mlb/low-res/10007217.png"), BirthCountry: "垃圾場",Weight:70, Height: 170, FirstName: "Dino", LastName: "Lee", Team: "Garbage", Jersey: 23, Position: "P", FanDuelName: "Mikey "))
    }
}
