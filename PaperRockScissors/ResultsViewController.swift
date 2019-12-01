//
//  ResultsViewController.swift
//  PaperRockScissors
//
//  Created by Helmers, Jesse L. on 11/29/19.
//  Copyright © 2019 Helmers, Jesse L. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var match: PRSMatch!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var replay: UIButton!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        resultsLabel.text = "butts"
//        // Do any additional setup after loading the view.
//    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.resultsLabel.text = messageHandler(match)
        self.image.image = imageMatchHandler(match)
    }
    
    @IBAction func replayAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func messageHandler(_ match: PRSMatch) -> String {
        
        // Handle the tie
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        // Here we build up the results message "RockCrushesScissors. You Win!" etc.
        return match.winner.description + " " + resultStringBuilder(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(_ match: PRSMatch) -> String {
        return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
    }
    
    func resultStringBuilder(_ gesture: PRS) -> String {
        switch (gesture) {
        case .paper:
            return "covers"
        case .rock:
            return "crushes"
        case .scissors:
            return "cuts"
        }
    }
    
   func imageMatchHandler(_ match: PRSMatch) -> UIImage {
    
        var name = ""

        switch (match.winner) {
        case .paper:
            name = "PaperCoversRock"
        case .rock:
            name = "RockCrushesScissors"
        case .scissors:
            name = "ScissorsCutPaper"
        }

        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
}
