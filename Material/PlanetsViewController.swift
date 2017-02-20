//
//  PlanetsViewController.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/18/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit
import iCarousel
import Kingfisher



class PlanetsViewController: UIViewController, iCarouselDataSource, iCarouselDelegate{

  @IBOutlet var carousel: iCarousel!
  fileprivate var planetsList = [Planet]()
  
  func fetchPlanets() {
    apollo.fetch(query: AllPlanetsQuery()) { (response, error) in
      guard (error == nil) else {
        print(error)
        return
      }
      
      if let planets = response?.data?.allPlanets?.planets {
        self.planetsList.removeAll()
        
        for planet in planets {
          
          if let planet = planet {
            let name = planet.name ?? ""
            let imageUrl = planet.imageUrl ?? "https://www.seo-camp.org/files/2016/09/globe-1348777_960_720.png"
            let terrains = planet.terrains as? [String] ?? []
            let population = planet.population ?? 0
            let orbitalPeriod = planet.orbitalPeriod ?? 0
            let diameter = 10
            let planet = Planet(name: name, imageUrl: imageUrl, terrains: terrains, population: population, orbitalPeriod: orbitalPeriod, diameter: diameter)
            self.planetsList.append(planet)
          }
          
          print(self.planetsList)
          
          self.carousel.reloadData()
          
        }
      }
      
      
    }
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
    carousel.delegate = self
    carousel.dataSource = self

    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxy")!)
      // Do any additional setup after loading the view.
    carousel.type = .invertedCylinder
    
    fetchPlanets()
  }

  
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PlanetsViewController {
  func numberOfItems(in carousel: iCarousel) -> Int {
    return planetsList.count
  }
  
  func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
    let planet = planetsList[index]

    let customView = Bundle.main.loadNibNamed("PlanetComponent", owner: self, options: nil)?.first as! PlanetComponent
    customView.lblName.text = planet.name
    let url = URL(string: planet.imageUrl)
    customView.imagePlanet.kf.setImage(with: url!)
    customView.backgroundColor = UIColor.clear
    customView.lblPopulation.text = "Population: \(String(planet.population))"
    customView.lblOrbitalPeriod.text = "Orbital period: \(String(planet.orbitalPeriod))"
    customView.lblDiameter.text = "Diameter: \(String(planet.diameter))"
    return customView

    
  }
  
  func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
  if (option == .spacing) {
  return value * 1.1
  }
  return value
  }
}
