//
//  APIService.swift
//  BeerRecommand
//
//  Created by KEEN on 2021/12/27.
//

import Foundation

enum APIError: Error {
  case invalidResponse
  case noData
  case failed
  case invalidData
}

extension APIError {
  var localizedDescription: String {
    switch self {
    case .invalidResponse: return "invalid Response"
    case .noData: return "no data"
    case .failed: return "failed"
    case .invalidData: return "invalid Data"
    }
  }
}

class APIService {
  
  static func fetchRandom(completion: @escaping (Beer?, APIError?) -> Void) {
    let url = URL(string: "https://api.punkapi.com/v2/beers/random")!
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        guard error == nil else {
          completion(nil, .failed)
          print(APIError.failed.localizedDescription)
          return
        }
        guard let data = data else {
          completion(nil, .noData)
          print(APIError.noData.localizedDescription)
          return
        }
        guard let response = response as? HTTPURLResponse else {
          completion(nil, .invalidResponse)
          print(APIError.invalidResponse.localizedDescription)
          return
        }
        guard response.statusCode == 200 else {
          completion(nil, .failed)
          print(APIError.failed.localizedDescription)
          return
        }
        
        do {
          let decoder = JSONDecoder()
          let beerInfo = try decoder.decode(BeerInfo.self, from: data)
          let beerData = beerInfo[0]
          completion(beerData, nil)
          // print(beerData[0])
          print("decode OK")
        } catch {
          completion(nil, .invalidData)
          print(APIError.invalidData.localizedDescription)
        }
      }
    }.resume()
  }
  
}
