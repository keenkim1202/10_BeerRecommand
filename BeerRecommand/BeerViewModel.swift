//
//  BeerViewModel.swift
//  BeerRecommand
//
//  Created by KEEN on 2022/01/01.
//

import Foundation

class BeerViewModel {
  var beer: Observable<Beer> = Observable(
    Beer(
      name: "none", tagline: "none",
      description: "none", imageUrl: nil,
      foodPairing: [], brewersTips: "none")
  )
  
  func fetchBeer() {
    APIService.fetchRandom { response, error in
      guard let response = response else {
        print("response fail.")
        return
      }
      
      self.beer.value = response
    }
  }
}
