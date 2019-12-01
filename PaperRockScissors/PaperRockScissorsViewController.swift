//
//  ViewController.swift
//  PaperRockScissors
//
//  Created by Helmers, Jesse L. on 11/29/19.
//  Copyright © 2019 Helmers, Jesse L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var match: PRSMatch!

    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var rock: NSLayoutConstraint!
    @IBOutlet weak var paper: UIButton!

    func slap(_ user: PRS) {
        let comp = PRS()
        
        self.match = PRSMatch(p1: user, p2: comp)
    }

    
    @IBAction func userAction(_ sender: UIButton) {
        switch(sender){
        case self.paper:
            slap(PRS.paper)
            performSegue(withIdentifier: "showResults", sender: self)
        case self.rock:
            slap(PRS.rock)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultViewController = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            resultViewController.match = self.match
            self.present(resultViewController, animated: true, completion: nil)
        default:
            slap(PRS.scissors)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultsViewController
        controller.match = self.match
    }
}

