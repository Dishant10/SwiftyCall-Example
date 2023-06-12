//
//  NetworkingManager.swift
//  GenericNetworking
//
//  Created by Dishant Nagpal on 04/06/23.
//

import Foundation

final class NetworkingManager {
    static let shared = NetworkingManager()
    
    private init() {}
    
    func fetch<T:Codable> (_ absoluteURL:String,type:T.Type,completion:@escaping (Result<T,Error>) -> Void){
        
        guard let url = URL(string: absoluteURL) else{
            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse,(200...300) ~= response.statusCode else{
                let statusCode = (response as! HTTPURLResponse).statusCode
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "\(statusCode) response error"])
                completion(.failure(error))
                return
                
            }
            
            guard let data = data else{
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid Data"])
                completion(.failure(error))
                return
                
            }
            do{
                let decoder = JSONDecoder()
                let res = try decoder.decode(T.self, from: data)
                completion(.success(res))
            }
            catch{
                completion(.failure(error))
            }
        }
        dataTask.resume()
        
    }
}
