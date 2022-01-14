//
//  PostsView.swift
//  facebook
//
//  Created by Mohamed Nasr on 16/12/2021.
//

import SwiftUI

struct PostsView: View {
    
    @State var alertIsShow = false
    @ObservedObject var networkHelper : NetworkHelper = NetworkHelper()
    
    var body: some View {
        if(networkHelper.loading)
        {
            Text("Loading").bold().font(.system(size: 40)).onAppear {
                self.networkHelper.fetchArticles()
            }
        }else{
            List{
                ForEach (networkHelper.posts, id: \.self) { post in
                    NavigationLink(destination: PostView(post: post)){
                        HStack{
                            PostImageView(imgUrl:post.urlToImage,maxWidth: 50,maxHeight: 50)
                            VStack(alignment:.leading,spacing: 5.0){
                                Text(post.title).font(.system(size: 18)).bold().lineLimit(1)
                                Text(post.description).lineLimit(2)

                            }
                        }
                    }
                }
            }.navigationTitle("All Posts")
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}

struct PostImageView: View {
    
    var imgUrl: String
    var maxWidth: CGFloat
    var maxHeight: CGFloat
    var body: some View {
        AsyncImage(
            url: URL(string: imgUrl),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:maxWidth, maxHeight: maxHeight)
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}
