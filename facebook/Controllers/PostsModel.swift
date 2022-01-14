

struct Article : Hashable,Decodable{
        
    var articles : [PostModel]
}


struct PostModel : Hashable,Decodable{
        
    var title: String
    
    var description : String

    var urlToImage : String

    var publishedAt : String
}
