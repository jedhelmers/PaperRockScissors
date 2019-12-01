import Foundation

struct PRSMatch {
    let p1: PRS
    let p2: PRS
    
    init(p1: PRS, p2: PRS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    var winner: PRS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
    
    var loser: PRS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
}
