//
//  PlanetComponent.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/18/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit

class PlanetComponent: UIView {

  @IBOutlet weak var imagePlanet: UIImageView!
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var lblPopulation: UILabel!
  @IBOutlet weak var lblOrbitalPeriod: UILabel!
  @IBOutlet weak var lblDiameter: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


extension UIView {
  class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIView? {
    return UINib(
      nibName: nibNamed,
      bundle: bundle
      ).instantiate(withOwner: nil, options: nil)[0] as? UIView
  }
}
