//
//  HistoryItem.swift
//  Quipu
//
//  Created by Abu Batjargal on 8/24/17.
//  Copyright © 2017 Abu Batjargal. All rights reserved.
//

import Foundation

class HistoryItem: NSObject {
    
    let date: String?
    let address: String?
    let weight: String?
    
    init(date: String, address: String, weight: String) {
        self.date = date
        self.address = address
        self.weight = weight
    }
    
    func getDate() -> String! {
        return self.date
    }
    
    func getAddress() -> String! {
        return self.address
    }
    
    func getWeight() -> String! {
        return self.weight
    }
    
}
