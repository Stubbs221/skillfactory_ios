//
//  Model.swift
//  26.6 Switch
//
//  Created by Vasily on 25.04.2022.
//

import Foundation

class Model {
    var segmentedControlPosition: Bool
    
    let photoContainer: [String] = ["photoOne", "photoTwo"]
    
    init(position: Bool) {
        segmentedControlPosition = position
    }
    
    func changeState() {
        self.segmentedControlPosition = !self.segmentedControlPosition
    }
}
