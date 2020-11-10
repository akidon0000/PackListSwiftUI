//
//  DataManager.swift
//  PackList_SwiftUI
//
//  Created by Akihiro Matsuyama on 2020/11/10.
//  Copyright © 2020 Akihiro Matsuyama. All rights reserved.
//

import SwiftUI

class DataManager {
    var tapedCellName:String = ""
    var mapType:String = "normal"
    var primaryKey: String = ""
    var infoType:String = ""
    var E1 = [
        ["E1UUID":"uuide11","packName":"旅行","comment":"テスト"],
        ["E1UUID":"uuide12","packName":"出張","comment":"いい"]
    ]
    var E2 = [
        ["E2UUID":"uuide21","parentsID":"uuide11","groupName":"衣類1","comment":"テスト"],
        ["E2UUID":"uuide22","parentsID":"uuide12","groupName":"衣類2","comment":"テスト"]
    ]
    var E3 = [
        ["E2UUID":"uuide31","parentsID":"uuide21","group":["uuidE3g11","uuidE3g12"]],
        ["E2UUID":"uuide32","parentsID":"uuide22","group":["uuidE3g21","uuidE3g22"]]
    ]
    var E4 = [
        ["parentsID":"uuide31","itemName":"パンツ","comment":"comment","num":0,"weight":0],
        ["parentsID":"uuide32","itemName":"パンツ","comment":"comment","num":0,"weight":0]
    ]
    
    static let shared = DataManager()
    private init() {
    }
    
}
