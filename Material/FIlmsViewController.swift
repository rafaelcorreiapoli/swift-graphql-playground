//
//  FirstViewController.swift
//  Material
//
//  Created by Rafael Ribeiro Correia on 2/16/17.
//  Copyright © 2017 Rafael Ribeiro Correia. All rights reserved.
//

import UIKit

class FilmsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  let cellIdentifier: String = "FilmTableViewCell"
  var filmsList = [Film]()
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    apollo.fetch(query: AllFilmsQuery()) { (response, error) in
      guard (error == nil) else {
        print (error!)
        return
      }
      
      if let films = response?.data?.allFilms?.films {
        self.filmsList.removeAll()
        for film in films {
          let director = film?.director
          let title = film?.title
          let releaseDate = film?.releaseDate
          let id = film?.id
          let episodeID = film?.episodeId
          
          let film = Film(id: id!, title: title!, director: director!, releaseDate: releaseDate!, episodeID: episodeID!)
          print(film)
          self.filmsList.append(film)
        }
        print(films)
        self.tableView.reloadData()
      }
     
    }
    
    
    tableView.register(UINib(nibName: "FilmTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmTableViewCell")
    tableView.rowHeight = 100
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
    tableView.backgroundColor = UIColor.black
    
  }

  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.filmsList.count
  }
  
  func getImageForEpisodeID(episodeID: Int) {
    
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FilmTableViewCell
    let film = self.filmsList[indexPath.row]
    cell.configWithFilm(film: film)
    
    return cell
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

}

