//
//  Fiilm.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/17/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import Foundation


struct Film {
  let id: String
  let title: String
  let director: String
  let releaseDate: String
  let episodeID: Int
  let coverImageUrl: String
  
  init(id: String, title: String, director: String, releaseDate: String, episodeID: Int) {
    switch episodeID {
    case 1:
      self.coverImageUrl = "http://a.dilcdn.com/bl/wp-content/uploads/sites/6/2015/09/Screen-Shot-2015-09-18-at-3.28.12-PM-2.png"
    case 2:
      self.coverImageUrl = "http://cdn3.thr.com/sites/default/files/imagecache/landscape_928x523/2014/11/star_wars_attack_of_the_clones.jpg"
    case 3:
      self.coverImageUrl = "https://i.kinja-img.com/gawker-media/image/upload/s--CwJtOaSq--/c_scale,fl_progressive,q_80,w_800/akojghcwpph6kmdnwd7v.jpg"
    case 4:
      self.coverImageUrl = "http://nerdist.com/wp-content/uploads/2016/11/star-wars-original-trilogy-1997-alamo.jpg"
    case 5:
      self.coverImageUrl = "http://www.indiewire.com/wp-content/uploads/2012/05/5-things-you-might-not-know-about-empire-strikes-back.jpg"
    case 6:
      self.coverImageUrl = "http://vignette1.wikia.nocookie.net/swfans/images/b/b9/Star_wars_return_of_the_jedi-1278919-1920x1080.jpg/revision/latest?cb=20140329205101"
    default:
      self.coverImageUrl = "http://vignette1.wikia.nocookie.net/swfans/images/b/b9/Star_wars_return_of_the_jedi-1278919-1920x1080.jpg/revision/latest?cb=20140329205101"
    }
    
    self.id = id
    self.title = title
    self.director = director
    self.releaseDate = releaseDate
    self.episodeID = episodeID
  }
  

}
