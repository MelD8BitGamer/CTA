//
//  ArtViewController.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private var artStuff = [ArtObject]()
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
         let navigationBar = self.navigationController?.navigationBar

                navigationBar?.setBackgroundImage(UIImage(), for: .default)
                navigationBar?.isTranslucent = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let indexPath = tableView.indexPathForSelectedRow,
      let detailViewController = segue.destination as? DetailedViewController else { fatalError("did not segue")}
      let eachCell = artStuff[indexPath.row]
      //we are setting this variable again to eachCell
        detailViewController.detailedRef = eachCell
      }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath) as? ThingsTableViewCell else { fatalError("Could not downcast to ThingsTableViewCell")}
        let things = artStuff[indexPath.row]
        cell.nameLabel.text = ""
        cell.nameDetailLabel.text = ""
       // cell.picImage
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
//      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let item = artStuff[indexPath.row]
//        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
//        let detailVC = storyboard.instantiateViewController(identifier: "ItemDetailController") { (coder) in
//          return
//        }
//        navigationController?.pushViewController(detailVC, animated: true)
//      }
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
      }
}


