//
//  SecondViewController.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/16/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit

class PeopleViewController: UICollectionViewController{
  // MARK: - Properties
  fileprivate let reuseIdentifier = "PersonCell"
  
  fileprivate var peopleList = [Person]()
  fileprivate let itemsPerRow: CGFloat = 2
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    
    collectionView?.backgroundColor = UIColor.black
    self.fetchPeople()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func fetchPeople() {
    apollo.fetch(query: AllPeopleQuery()) { (response, error) in
      guard !(error != nil) else {
        print (error!)
        return
      }
      
      if let people = response?.data?.allPeople?.people {
        self.peopleList.removeAll()
        for person in people {
          let name = person?.name
          if let imageUrl = person?.imageUrl {
            let person = Person(name: name!, imageUrl: imageUrl);
            self.peopleList.append(person)
          }
          
        }
        print(self.peopleList)
        self.collectionView?.reloadData()
      }
    }
  }


}

// MARK: - Private
private extension PeopleViewController {
  func personForIndexPath(indexPath: IndexPath) -> Person {
    return peopleList[(indexPath as NSIndexPath).row]
  }
}


// MARK: - UICollectionViewDataSource
extension PeopleViewController {
  override func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
    return peopleList.count
  }
  
  override func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! PersonCell
    
    print(indexPath.row)
    print(indexPath)
    cell.configWithPerson(person: personForIndexPath(indexPath: indexPath))

    return cell
  }
}



extension PeopleViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let availableWidth = view.frame.width
    let widthPerItem = availableWidth / itemsPerRow
    
    return CGSize(width: widthPerItem, height: widthPerItem)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  
}
