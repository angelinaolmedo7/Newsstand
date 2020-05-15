//
//  APIClient.swift
//  Moviefy
//
//  Created by Angelina Olmedo on 4/29/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation
struct APIClient{
    static let shared = APIClient()
    let session = URLSession(configuration: .default)
    
    func getNews(cat: Any! = "business", _ completion: @escaping (Result<[NewsStory]>) -> ()) {
        do{
            let parameters = [
                   "country": "us",
                   "category": cat!
            ]
            
          // Creating the request
            let request = try Request.configureRequest(from: .headlines, with: parameters, and: .get, contains: nil)
                session.dataTask(with: request) { (data, response, error) in

                if let response = response as? HTTPURLResponse, let data = data {

                    let result = Response.handleResponse(for: response)
                    switch result {
                    case .success:
                        //Decode if successful
                        let result = try? JSONDecoder().decode(NewsApiResponse.self, from: data)
//                        print(result)
                        completion(Result.success(result!.articles!))

                    case .failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        }catch{
            completion(Result.failure(NetworkError.badRequest))
        }
    }
    
    func createSession(requestToken: String, _ completion: @escaping (Result<CreateSessionResponse>) -> Void){}
}

