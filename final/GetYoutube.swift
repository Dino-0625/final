//
//  GetYoutube.swift
//  final
//
//  Created by tsui erh li on 2021/1/1.
//

import SwiftUI

struct GetYoutube: View {
    //private var url : String
    @State private var video = [Result3]()
    func fetchVideo() {
        let urlStr = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=PLL-lmlkrmJak4XW2sUGbOdSTJPXJeqcqW&key=AIzaSyCqF66E5JKekk-wfcO8Cy9kuP1ikrxsQQo&maxResults=20"
        if let url = URL(string: urlStr) {
            print("dd")
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                  if let data = data {
                     do {
                        let temp = try JSONDecoder().decode(ResultVideo.self, from: data)
                        print(temp)
                        video = temp.items
                     } catch {
                        print(error)
                     }
                  }
               }
            task.resume()
        }
    }
    var body: some View {
        VStack{
            
            Text("ff")
            
            List(video.indices, id:\.self, rowContent: { (index) in
                
                VStack {
                    
                    Text(video[index].contentDetails.videoId)
                    
                    //Text(video[index].snippet.thumbnails.channelTitle)
                    
                    //Text(video[index].snippet.thumbnails.medium.url)
                }
                
            })
            
        }.onAppear(perform: {
            fetchVideo()
        })
    }
}

struct GetYoutube_Previews: PreviewProvider {
    static var previews: some View {
        GetYoutube()
    }
}

