//
//  Myfavorite.swift
//  final
//
//  Created by User12 on 2021/1/8.
//

import SwiftUI
import CoreData
import URLImage
struct ToDoItem : Identifiable{
    var id = UUID()
        var name: String = ""
        
        var isComplete: Bool = false
}
struct Myfavorite: View {
    @State var searchText = ""
    @State var showEditor = false
    let todoItems = [ToDoItem(name: "Meet Eddie for lunch"),
                                  ToDoItem(name: "Buy toilet paper"),
                                  ToDoItem(name: "Write a new tutorial"),
                                  ToDoItem(name: "Buy two bottles of wine"),
                                  ToDoItem(name: "Prepare the presentation deck")
                                    ]
    
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PlayerIDDD.playerid, ascending: true)],
        animation: .default)
    
    var products: FetchedResults<PlayerIDDD>
    //players.indices, id:\.self, rowContent: { (index)
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
        NavigationView{
            
                
            VStack(){
                   
                SearchBar(text: $searchText).padding(.top, -30).offset(y:25)
                
                List{
                    ForEach(products.filter({ searchText.isEmpty ? true : $0.player_lname!.contains(searchText) })) { (item) in
                    HStack{
                        if let temp = item.player_url {
                            
                            URLImage(url: URL(string:temp)!) { image in
                            image
                                .resizable()
                                .scaledToFill().frame(width:60,height:60).clipped()
                            }
                        }
                        VStack(alignment:.leading){
                            if let temp = item.player_jersey {
                           
                                Text("Jersey:"+temp)
                            }
                            //Text("Jersey:"+item.player_jersey!)
                            if let temp = item.player_lname {
                                Text(item.player_fname!+"  "+temp)
                            }
                           
                            
                        }
                        
                    }
                    }.onDelete(perform: deleteItems)
                //}
                //.navigationBarTitle("Player List")
                }
                .navigationBarTitle("Player").toolbar(content:{ToolbarItem(placement:.navigationBarTrailing){
                    Button(action:{showEditor=true},label:{Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.purple)})
                }
                
                }
                
                ).sheet(isPresented:$showEditor){
                    NavigationView{
                        AddPlayerView()
                    }
                }.offset(y:25)
            }
            
    }
}
    private func addItem() {
        withAnimation {
            let newItem = PlayerIDDD(context: viewContext)
            newItem.playerid = "dddd"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { products[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    /*private func delete(at offsets: IndexSet) {
        for index in offsets {
            context.delete(products[index])
        }

        do {
            try context.save()
        } catch {
            print("\(error)")
        }
    }*/
}

struct Myfavorite_Previews: PreviewProvider {
    static var previews: some View {
        Myfavorite().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
/*List{
    //SearchBar(text: $searchText)
    ForEach(products) { product in
        
        NavigationLink(destination: EditPlayerView()) {
            //PlayerRow(player: products[index])
            HStack{
                if let temp = product.player_url {
                URLImage(url: URL(string:temp)!) { image in
                    image
                        .resizable()
                        .scaledToFill().frame(width:60,height:60).clipped()
                }
                }
                VStack(alignment:.leading){
                    Text("Id:"+product.playerid!)
                    if let temp = product.player_lname {
                        Text(product.player_fname!+"  "+temp)
                    }
                   
                    
                }
                
            }
            
            
        }
    }
    
        .onDelete(perform: deleteItems)
}
    .navigationBarTitle("Player List")
    .navigationBarItems(trailing: NavigationLink(destination: AddPlayerView()) {
        Image(systemName: "plus")
    })*/
