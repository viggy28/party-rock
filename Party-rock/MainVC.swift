//
//  ViewController.swift
//  Party-rock
//
//  Created by Vignesh Ravichandran on 1/29/17.
//  Copyright © 2017 Vignesh Ravichandran. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview : UITableView!
    var partyRocks = [PartyRock]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview.delegate = self
        tableview.dataSource = self
        
        let p1 = PartyRock(imageURL: "https://static1.squarespace.com/static/50c90f58e4b015d1d5e8a064/t/55553a09e4b00de931e7c921/1431648779556/Uptown+Funk+sucks.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/OPf0YbXqDm0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Uptown Funk")
        
        let videourl1 = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/PT2_F-1esPk\" frameborder=\"0\" allowfullscreen></iframe>"
        let videotitle1 = "Chainsmockers"
        let imageurl1 = "https://s-media-cache-ak0.pinimg.com/originals/c0/bd/40/c0bd40c1dc2c1f36f8ff608e8746fcf0.jpg"
        
        let p2 = PartyRock(imageURL: imageurl1, videoURL: videourl1, videoTitle: videotitle1)
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell
        {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
            
        }
        else
        {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC
        {
            if let party = sender as? PartyRock
            {
                destination.partyRock = party
            }
        }
    }
    
    

}

