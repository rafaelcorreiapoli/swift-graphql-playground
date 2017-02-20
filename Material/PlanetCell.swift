//
//  PlanetCell.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/18/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit
import expanding_collection

class PlanetCell: BasePageCollectionCell {
//  @IBOutlet weak var front: UIView!
//  @IBOutlet weak var frontContainerView: UIView!
//  @IBOutlet weak var frontContainerView: UIView!
//  @IBOutlet weak var backContainerView: UIView!
//  @IBOutlet weak var frontConstraintY: NSLayoutConstraint!
//
//  @IBOutlet weak var backConstraintY: NSLayoutConstraint!
  
  @IBOutlet weak var imageUrl: UIImageView!
  @IBOutlet weak var lblPopulation: UILabel!
  @IBOutlet weak var lblName: UILabel!
  
  @IBOutlet weak var lblRotationPeriod: UILabel!
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
    
  }

  func configWithPlanet(planet: Planet) {
    let url = URL(string: planet.imageUrl)
    if let url = url {
      imageUrl.kf.setImage(with: url)
    } else {
      imageUrl.kf.setImage(with: nil)
    }
    
    
    lblPopulation.text = String(planet.population)
    lblRotationPeriod.text = String(planet.orbitalPeriod)
    lblName.text = planet.name
    
    lblPopulation.textColor = UIColor.white
    lblRotationPeriod.textColor = UIColor.white
    lblName.textColor = UIColor.white
    
  }
}
