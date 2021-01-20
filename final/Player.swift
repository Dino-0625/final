//
//  PlayerView.swift
//  final
//
//  Created by User02 on 2020/12/28.
//

import Foundation


struct Player_40_result : Codable {
    let roster_40 : Alls2
}

struct PlayerResults : Codable {
    let player_info : Alls
}
struct Alls : Codable {
    let queryResults : Result
}

struct Alls2 : Codable {
    let queryResults : Result2
}

struct Result : Codable {
    let row : Detail
}

struct Result2 : Codable {
    let row : [Detail2]
}
struct Detail2 : Codable {
    let name_use: String
    let player_id: String
}
struct Detail : Codable {
    let jersey_number: String
    let birth_country: String
    let weight: String
    let name_full: String
    let bats: String
    let team_abbrev: String
    let player_id: String //665487
    
}

struct ResultVideo : Codable {
    
    let items : [Result3]
}
struct Result3 : Codable {
    
    let contentDetails : Detail3
    
    let snippet : Thum
}
struct Detail3 : Codable {
    
    let videoId: String
}

struct Chan : Codable {
    
    let high : Detail5?
}

struct Thum : Codable {
    
    let thumbnails : Chan
}

struct Detail5 : Codable {
    
    let url: URL
}
 

/*struct Detail6 : Codable {
    
    let url: String
}*/
//------------------------------------------

struct TeamPlayer_ : Codable {
    let PlayerID : Int
    let PhotoUrl : URL?
    let BirthCountry : String?
    let Weight : Int?
    let Height : Int?
    let FirstName : String
    let LastName : String?
    let Team : String?
    let Jersey : Int?
    let Position : String?
    let FanDuelName: String?
}

//------------------------------------------
struct PlayerStat : Codable {
    
    
    let Games : Int
}
