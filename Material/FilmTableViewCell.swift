//
//  FilmTableViewCell.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/16/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit
import Kingfisher

class FilmTableViewCell: UITableViewCell {

  @IBOutlet weak var labelReleaseDate: UILabel!
  @IBOutlet weak var labelTitle: UILabel!
  @IBOutlet weak var imageBackground: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
        // Configure the view for the selected state
    }
  
  func configWithFilm(film : Film) {
    self.labelTitle.text = film.title;
    self.labelReleaseDate.text = film.releaseDate;
    
    let url = URL(string: film.coverImageUrl)
  
//    let processor = BlurImageProcessor(blurRadius: 4) >> OverlayImageProcessor(overlay: .black, fraction: 0.5)
    let processor = OverlayImageProcessor(overlay: .black, fraction: 0.3)
    self.imageBackground.kf.setImage(with: url, placeholder: nil, options: [.processor(processor)])
  }
    
}
