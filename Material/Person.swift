//
//  Person.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/18/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import Foundation

struct Person {
  let name: String
  let imageUrl: String
  
  
  init(name: String, imageUrl: String = "http://vignette3.wikia.nocookie.net/darth/images/2/2b/Anakin_12.png/revision/latest?cb=20090110041205") {
    self.name = name
    self.imageUrl = imageUrl
  }
}
