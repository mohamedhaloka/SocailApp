//
//  PostView.swift
//  facebook
//
//  Created by Mohamed Nasr on 16/12/2021.
//

import SwiftUI

struct PostView: View {
    var post : PostModel?
    var body: some View {
        VStack{
            Spacer()
            Text(post?.title ?? "").bold().font(.system(size: 26)).padding()
            Spacer()
            
            PostImageView(imgUrl: post?.urlToImage ?? "",maxWidth: 300,maxHeight: 200)
            Spacer()
            Text(post?.description ?? "").padding()
            Spacer()
            HStack(alignment:.center){
                Text("Published at: ")
                Text(post?.publishedAt ?? "")
            }
            Spacer()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: PostModel( title: "", description: "", urlToImage: "", publishedAt: ""))
    }
}
