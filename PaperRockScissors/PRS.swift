//
//  PRS.swift
//  PaperRockScissors
//
//  Created by Helmers, Jesse L. on 11/29/19.
//  Copyright © 2019 Helmers, Jesse L. All rights reserved.
//

import Foundation

enum PRS {
    case paper, rock, scissors
    
    init() {
        switch arc4random() % 3 {
        case 0:
            self = .paper
        case 1:
            self = .rock
        default:
            self = .scissors
        }
    }
    
    func defeats(_ opponent: PRS) -> Bool {
        switch (self, opponent) {
        case (.paper, .rock), (.scissors, .paper), (.rock, .scissors):
            return true
        default:
            return false
        }
    }
}

extension PRS: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .paper:
                return "Paper"
            case .rock:
                return "Rock"
            case .scissors:
                return "Scissors"
            }
        }
    }
}
