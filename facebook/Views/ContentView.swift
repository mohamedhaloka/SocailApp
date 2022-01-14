//
//  ContentView.swift
//  facebook
//
//  Created by Mohamed Nasr on 10/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""

    var body: some View {
        NavigationView{
            VStack{
                Image("meta").resizable().aspectRatio(2, contentMode: .fit).frame(width: 120, height: 100, alignment: .center)
                Spacer()
                TextFormField(label: "Email", text: username).padding(.bottom)
                TextFormField(label: "Password", text: username).padding(.bottom,40)
                NavigationLink(destination: PostsView() ){
                    ButtonView(text: "Login")
                }
                NavigationLink (destination: Register()) {
                    Text("Register now!")
                }.padding(.top,30)

                Spacer()
            }.padding().navigationTitle("Log in")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextFormField: View {
    
    var label : String ;
    @State var text : String ;
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            Text(label).foregroundColor(Color.blue)
            TextField(label, text: $text).padding().overlay(RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 1).foregroundColor(Color.blue)).disableAutocorrection(true)
        }
    }
}

struct ButtonView: View {
    var text : String
    var body: some View {
        Text(text).frame(maxWidth:.infinity).padding().foregroundColor(Color.white).background(Color.blue).clipShape(RoundedRectangle(cornerRadius: 6))
    }
}
