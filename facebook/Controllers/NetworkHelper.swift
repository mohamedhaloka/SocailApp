import Foundation



class NetworkHelper : ObservableObject {
    
    @Published var posts : [PostModel] = []
    @Published var loading : Bool = true;
    
    @Published var url : String = "https://newsapi.org/v2/everything?q=Apple&from=2021-12-17&sortBy=popularity&apiKey=e19d345eac33456d9a851b2ef71b84cf"
    
    func fetchArticles(){
        print("data is firstt" );
        print(url );
        if let urlString = URL(string: url) {
        
            
        let urlRequest = URLSession(configuration: .default)
            
        let urlSession = urlRequest.dataTask(with: urlString, completionHandler: { data, urlResponse, error in
            
            print("data geettt it" );

                if(error != nil)
                {
                    print(error?.localizedDescription ?? "" )
                    return ;
                }
            
            
            if let safeData = data {
                let decoder = JSONDecoder()
                
                do{
                    print("hhhhhihihihiihiihhi")

                    let result = try decoder.decode(Article.self, from: safeData)
                    
                    print(result.articles[0].title)
                    
                    DispatchQueue.main.async {
                        self.posts = result.articles;
                        self.loading = false;
                    }
                    
                }catch{
                    print("throw error ", error)
                }

            }
                
            }
        )
            
            urlSession.resume()

        }
        
        
        
        
    }
    
}
