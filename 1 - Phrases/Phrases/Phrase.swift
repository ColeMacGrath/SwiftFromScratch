//
//  Phrase.swift
//  Phrases
//
//  Created by Moisés on 7/27/22.
//

import Foundation

struct Phrase: Decodable {
    let activity: String
    let type: String
}

enum APIError {
    case invalidURL
    case invalidData
    case invalidResponse
}

class APIService {
    private static let _shared = APIService()
    private let configuration = URLSessionConfiguration.default
    private let urlSession: URLSession
    
    static var shared: APIService {
        return self._shared
    }
    
    init() {
        self.urlSession = URLSession(configuration: self.configuration)
    }
    
    func request(url: String, handler: @escaping (_ phrase: Phrase?, _ error: APIError?) -> Void) {
        guard let url = URL(string: url) else {
            handler(nil, .invalidURL)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let data = data else {
                handler(nil, .invalidData)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let phrase = try decoder.decode(Phrase.self, from: data)
                handler(phrase, nil)
            } catch {
                handler(nil, .invalidResponse)
            }
        }
        
        dataTask.resume()
        
    }
    
}
