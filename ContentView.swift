//  ContentView.swift
//  Global

//  Created by Sanika Kale on 8/14/20.
//  Copyright © 2020 Techy People. All rights reserved.


import SwiftUI

struct ContentView: View {
    let cars = ["Los Angelos, CA, USA", "Phillipines", "San Diego, CA, USA", "Manilla, Philadelpia, PA, USA", "Pittsburg, PA, USA", "New York, USA", "Washinton DC, USA", "Boise, Idaho, USA", "Columbus, Ohio, USA", "Denver, Colorado, USA", "Los Gatos, CA, USA", "Louisville, KY, USA", "Roseville, CA, USA", "Saginaw, MI, USA", "Warsaw, Poland", "Brussels, Belgium", "Melbourne, Austrailia", "Canberra, Austrailia", "Quebec, Canada", "Sydney, Austrailia", "Sacramento,", "San Francisco, CA, USA", "Santa Anna, TX, USA", "Chicaco, IL, USA"]
    @State private var searchText : String = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search location")
                List {
                    ForEach(self.cars.filter {
                        self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
                    }, id: \.self) { car in
                        Text(car)
                    }
                }.navigationBarTitle(Text("Cars"))
            }
        }
      
      HStack {
        VStack {
            
            HStack {
                TabView(selection: $selection){
                        
                    ScrollView {
                           VStack(alignment: .center, spacing: 300.0) {
                            HStack {
                                Image("second")
                            
                            }
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                    Image("second")
                                }
                                Text("HomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHomeHome")
                                .font(.title)
                                
                           }
                           
                        }
                        .tabItem {
                                VStack() {
                                    Image("first")
                                    Text("Home")
                                }
                            }
                            .tag(0)
                        
                            Text("BLM")
                                .font(.title)
                                .tabItem {
                                    VStack {
                                        Image("second")
                                        Text("BLM")
                                    }
                                }
                              .tag(1)
                            Text("Environment")
                                .font(.title)
                                .tabItem {
                                    VStack {
                                        Image("second")
                                        Text("Environment")
                                        }
                                    }
                                .tag(2)
                }
                
               
                }
            }
        }
    }
    }


struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
