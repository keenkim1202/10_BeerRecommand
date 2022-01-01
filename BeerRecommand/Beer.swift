//
//  Beer.swift
//  BeerRecommand
//
//  Created by KEEN on 2022/01/01.
//

import Foundation

struct Beer: Codable {
  let name: String
  let tagline: String
  let description: String
  let imageUrl: String?
  let foodPairing: [String]
  let brewersTips: String

  enum CodingKeys: String, CodingKey {
    case name, tagline, description
    case imageUrl = "image_url"
    case foodPairing = "food_pairing"
    case brewersTips = "brewers_tips"
  }
}

typealias BeerInfo = [Beer]
