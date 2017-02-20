//
//  PersonCell.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/18/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var labelName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      configLayout()
    }
  
  func configLayout() {
    image.applyBottomGradient()
  }
  
  func configWithPerson(person: Person) {
    
    let url = URL(string: person.imageUrl)
    image.kf.setImage(with: url)
    labelName.text = person.name
  }
}


extension UIImageView {
  func applyBottomGradient() {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.frame
    gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
    gradient.locations = [0, 0.8]
    self.layer.insertSublayer(gradient, at: 0)
  }
}

