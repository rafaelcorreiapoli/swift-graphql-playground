//
//  Planet.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/18/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import Foundation

struct Planet {
  let name: String
  let imageUrl: String
  let terrains: [String]
  let population: Int
  let orbitalPeriod: Int
  let diameter: Int
  
  init(name: String, imageUrl: String, terrains: [String], population: Int, orbitalPeriod: Int, diameter: Int) {
    self.name = name
    self.imageUrl = imageUrl
    self.terrains = terrains
    self.population = population
    self.orbitalPeriod = orbitalPeriod
    self.diameter = diameter
  }
}
