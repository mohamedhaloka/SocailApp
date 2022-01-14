//
//  Register.swift
//  facebook
//
//  Created by Mohamed Nasr on 15/12/2021.
//

import SwiftUI

struct Register: View {
    
    @State var name : String = ""
    @State var email : String = ""
    @State var pass : String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
            VStack{
                Image("meta").resizable().aspectRatio(2, contentMode: .fit).frame(maxWidth:120)
                Spacer()
                TextFormField(label: "Name", text: name).padding(.bottom)
                TextFormField(label: "Email", text: email).padding(.bottom)
                TextFormField(label: "Password", text: pass).padding(.bottom)
                ButtonView(text: "Register")
                Button ("Login Now"){
                    self.mode.wrappedValue.dismiss()
                }.padding(.top,30)

                Spacer()
            }.padding().navigationTitle("Register")
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
