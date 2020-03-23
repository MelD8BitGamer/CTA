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
        return
    }
    
    
}
