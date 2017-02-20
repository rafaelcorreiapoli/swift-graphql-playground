//
//  PlanetsViewController.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/18/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit
import expanding_collection

class _PlanetsViewController: ExpandingViewController {
  fileprivate var cellsIsOpen = [Bool]()
  fileprivate let cellIdentifier: String = "PlanetCell"
  fileprivate var planetsList = [Planet]()
  
  
  override func viewDidLoad() {
    itemSize = CGSize(width: 200, height: 200)
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxy")!)
    
//    let gradient: CAGradientLayer = CAGradientLayer()
//    gradient.frame = self.view.frame
//    gradient.colors = [UIColor.darkGray.cgColor, UIColor.black.cgColor, UIColor.red.cgColor]
//    gradient.locations = [0, 0.1, 0.9]
//    self.view.layer.insertSublayer(gradient, at: 0)
    
    
    registerCell()
    fillCellIsOpenArry()
    fetchPlanets()
  }

  
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
            let imageUrl = planet.imageUrl ?? ""
            let terrains = planet.terrains as? [String] ?? []
            let population = planet.population ?? 0
            let orbitalPeriod = planet.orbitalPeriod ?? 0
            
            let planet = Planet(name: name, imageUrl: imageUrl, terrains: terrains, population: population, orbitalPeriod: orbitalPeriod, diameter: 10)
            self.planetsList.append(planet)
          }
          
          print(self.planetsList)
          
          self.collectionView?.reloadData()
          
        }
      }
      
      
    }
  }
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
}


// MARK: Helpers
extension _PlanetsViewController {
  fileprivate func registerCell() {
    let nib = UINib(nibName: cellIdentifier, bundle: nil)
    collectionView?.register(nib, forCellWithReuseIdentifier: cellIdentifier)
  }
  
  fileprivate func fillCellIsOpenArry() {
    for _ in planetsList {
      cellsIsOpen.append(false)
    }
  } 
}


// MARK: UICollectionViewDataSource

extension _PlanetsViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return planetsList.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PlanetCell
    
    let planet = planetsList[indexPath.row]
    // configure cell
    cell.configWithPlanet(planet: planet)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    guard let cell = collectionView.cellForItem(at: indexPath) as? PlanetCell
      , currentIndex == (indexPath as NSIndexPath).row else { return }
    
    let planet = planetsList[indexPath.row]
    cell.cellIsOpen(!cell.isOpened)
    cell.configWithPlanet(planet: planet)
  }
  
  
}
