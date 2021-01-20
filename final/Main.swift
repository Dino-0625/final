//
//  Main.swift
//  final
//
//  Created by tsui erh li on 2020/12/31.
//

import SwiftUI
import URLImage
import AlertX
import Lottie
struct Main: View {
    
    @State private var showAlertX = false
    @State private var currentPage = 1
    @State private var video = [Result3]()
    @State private var video2 = [Result3]()
    @State private var image : [Image] = [Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),Image(systemName:"photo"),]
    @State private var downloadImageOk: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    @State private var downloadImageOk2: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    func fetchVideo(urlStr : String) {
        /*let urlStr = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=PLL-lmlkrmJak4XW2sUGbOdSTJPXJeqcqW&key=AIzaSyCqF66E5JKekk-wfcO8Cy9kuP1ikrxsQQo&maxResults=20"*/
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
        fetchVideo2(urlStr: "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UUdhukF6o5_ENjbf_9oNGXNQ&key=AIzaSyCqF66E5JKekk-wfcO8Cy9kuP1ikrxsQQo&maxResults=20")
    }
    func fetchVideo2(urlStr : String) {
        /*let urlStr = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=PLL-lmlkrmJak4XW2sUGbOdSTJPXJeqcqW&key=AIzaSyCqF66E5JKekk-wfcO8Cy9kuP1ikrxsQQo&maxResults=20"*/
        if let url = URL(string: urlStr) {
            print("dt")
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                  if let data = data {
                     do {
                        let temp = try JSONDecoder().decode(ResultVideo.self, from: data)
                        print(temp)
                        video2 = temp.items
                     } catch {
                        print(error)
                     }
                  }
               }
            task.resume()
        }
    }
    func downLoad(url:URL,temp:Int) {
        if let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            image[temp] = Image(uiImage: uiImage)
            downloadImageOk[temp] = true
        }
        print(temp)
    }
    
    var body: some View {
        
        NavigationView{
           
            ZStack {
                Color.black
                
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                    /*TabView(selection: $currentPage) {
                        ForEach(1..<8) { (index) in
                            Image("Tatis")
                            .resizable()
                            .scaledToFit()
                               
                        }
                    }.frame(height:100)
                    .tabViewStyle(PageTabViewStyle())*/
                    WebView(urlString: "https://www.mlb.com/").frame(height:200)
                    /*HStack(spacing:120){
                        Text("Top Stories")
                        NavigationLink(destination:Myfavorite()){*/
                            
                       /* }
                    }*/
                    /*Button(action: {
                            self.showAlertX.toggle()
                        }, label: {
                            Text("Show AlertX")
                        }).alertX(isPresented: $showAlertX, content: {
                            AlertX(title: Text("The Title"), theme: .wine())
                        })*/
                    NavigationLink(destination:WebView(urlString: "https://www.mlb.com/" )){
                        URLImage(url: URL(string:"https://i.ytimg.com/vi/iGNpiUAL1rg/hqdefault.jpg")!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                   
                    
                    ScrollView(.horizontal){
                            
                            HStack(spacing:20){
                                
                                ForEach(video.indices , id: \.self){ (index) in
                                    
                                    if let temp2 = video[index].contentDetails.videoId {
                                        
                                        let temp = "https://www.youtube.com/watch?v=" + temp2
                                        
                                        if let temp3 = temp {
                                            Link(destination: URL(string:temp3)!) {
                                                
                                                image[index].resizable().scaledToFill().frame(height:100).background(Color.black).cornerRadius(40).shadow(radius:10).onAppear {
                                                    if downloadImageOk[index] == false {
                                                        
                                                        if let tt = video[index].snippet.thumbnails.high {
                                                            downLoad(url:tt.url,temp:index)
                                                            print(tt.url)
                                                        }
                                                        /*video[index].snippet.thumbnails.high!.url*/
                                                        /*URL(string: "https://wakelandtheatre.files.wordpress.com/2013/11/final-poster.jpg")!*/
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                
                            }
                        }.onAppear(perform: {
                            fetchVideo(urlStr: "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=PLL-lmlkrmJak4XW2sUGbOdSTJPXJeqcqW&key=AIzaSyCqF66E5JKekk-wfcO8Cy9kuP1ikrxsQQo&maxResults=20")
                            
                        }).frame(height: 100).background(Image("mitsai").resizable().scaledToFill().frame(width:400,height:100).clipped())
                    Button(action: {
                        
                        self.showAlertX.toggle()
                        }, label: {
                            Text("Show Next")
                        }).alertX(isPresented: $showAlertX, content: {
                            AlertX(title: Text("Open"), theme: .wine())
                        })
                    
                    if (showAlertX == true) {
                    ScrollView(.horizontal){
                            
                            HStack(spacing:20){
                                
                                ForEach(video.indices , id: \.self){ (index) in
                                    
                                    if let temp2 = video[index].contentDetails.videoId {
                                        
                                        let temp = "https://www.youtube.com/watch?v=" + temp2
                                        
                                        if let temp3 = temp {
                                            Link(destination: URL(string:temp3)!) {
                                                
                                                image[index].resizable().scaledToFill().frame(height:100).background(Color.black).cornerRadius(40).shadow(radius:10).onAppear {
                                                    if downloadImageOk2[index] == false {
                                                        
                                                        if let tt = video2[index].snippet.thumbnails.high {
                                                            downLoad(url:tt.url,temp:index)
                                                            print(tt.url)
                                                        }
                                                        /*video[index].snippet.thumbnails.high!.url*/
                                                        /*URL(string: "https://wakelandtheatre.files.wordpress.com/2013/11/final-poster.jpg")!*/
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                
                            }
                        }.onAppear(perform: {
                            
                        }).frame(height: 100).background(Image("mitsai").resizable().scaledToFill().frame(width:400,height:100).clipped())
                    }
                    
                    
                }
                //EmitterLayerView()
            }.navigationTitle("MLB on Youtube")
            
        }.navigationTitle("MLB on Youtube")
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
