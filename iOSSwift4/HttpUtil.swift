//
//  HttpUtil.swift
//  iOSSwift4
//
//  Created by Xurpas Enterprise on 23/04/2018.
//  Copyright © 2018 Xurpas Enterprise. All rights reserved.
//
//
import Foundation

struct User: Codable {
    let id: Int
    let first_name: String
    let image: String
    
//    enum CodingKeys: String, CodingKeys {
//        case user = "id"
//        case name
//    }
}




enum Result<Value> {
    case success(Value)
    case failure(Error)
}

class HttpUtil{
    
    let HOST_URL = "https://api.mockaroo.com/api/8b756440?count=100"
    let HOST_KEY = "51231710"
    
    let count = 100
//    var headers: [String: String] = []
//    "X-API-Key: 51231710"
//    https://api.mockaroo.com/api/8b756440?count=100
    
//    func getPosts(for userId: Int, completion: ((Result<[User]>) -> Void)?) {
    //                          completionBlock: @escaping (String) -> Void
    func getPosts( completion: ((Result<[User]>) -> Void)?) -> Void{
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.mockaroo.com"
        urlComponents.path = "/api/8b756440"
        let userIdItem = URLQueryItem(name: "count", value: "\(count)")
//        urlComponents.queryItems = [userIdItem, URLQueryItem(name: "key", value: "51231710")]
        urlComponents.queryItems = [userIdItem]
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        // "X-API-Key: 51231710"
        request.addValue("51231710", forHTTPHeaderField: "X-API-Key")
      
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
            
                if let error = responseError {
                    completion?(.failure(error))
                    print ("Error")
                    print (error)
                } else if let jsonData = responseData {
                    print("Success")
                    print(jsonData)
                    // Now we have jsonData, Data representation of the JSON returned to us
                    // from our URLRequest...
                    
                    // Create an instance of JSONDecoder to decode the JSON data to our
                    // Codable struct
                    let decoder = JSONDecoder()
                    
                    do {
                        // We would use Post.self for JSON representing a single Post
                        // object, and [Post].self for JSON representing an array of
                        // Post objects
                        let posts = try decoder.decode([User].self, from: jsonData)
                        completion?(.success(posts))
                        print ("COmplte POST")
//                        users = try decoder.decode([User].self, from: jsonData)
                        
//                        return users
                      
                        
                    } catch {
                        print("sucess exception error")
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
//    func getPostsFromDisk() -> [User] {
//        // 1. Create a url for documents-directory/posts.json
////        let url = getDocumentsURL().appendingPathComponent("posts.json")
//        let decoder = JSONDecoder()
//        do {
//            // 2. Retrieve the data on the file in this path (if there is any)
////            let data = try Data(contentsOf: url, options: [])
//            let data = []
//            // 3. Decode an array of Posts from this Data
//            let posts = try decoder.decode([User].self, from: data)
//            return posts\\
//        } catch {
//            fatalError(error.localizedDescription)
//        }
//    }
    //view rawJSON-Persistence-1.swift hosted with ❤ by GitHub
//    func performCall(){
//        guard let url = URL(string: HOST_URL) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//
//            guard let data = data else { return }
//
//            }.resume()
//    }
}
