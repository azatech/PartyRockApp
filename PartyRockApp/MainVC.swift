//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Azat IOS on 14.07.17.
//  Copyright © 2017 azatech. All rights reserved.
//

import UIKit


class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()


        let p1 = PartyRock(imageURL: "https://assets.audiomack.com/iamjasoncraig/3f635c17b6f4879a9c9ed96b8af0c05d-275-275.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xGiBiHocSZM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "New Thang")

        let p2 = PartyRock(imageURL: "http://www.youredm.com/wp-content/uploads/2014/02/Lets-Get-Ridiculous-Remix.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")

        let p3 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/2/21/Redfoo_-_Juicy_Wiggle_%28cover%29.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")

        let p4 = PartyRock(imageURL: "http://images.junostatic.com/full/CS2939427-02A-BIG.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Md-8YlE-KhA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Booty Man")

        let p5 = PartyRock(imageURL: "http://www.billboard.com/files/media/redfoo-prm-cover-2015-billboard-embed.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock")

        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)


        tableView.delegate   = self
        tableView.dataSource = self
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let PartyRock = partyRocks[indexPath.row]

            cell.updateUI(partyRock: PartyRock)

            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]

        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination  = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }





}

