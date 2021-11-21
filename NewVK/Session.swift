//
//  Session.swift
//  NewVK
//
//  Created by Тарас Пешков on 21.11.2021.
//

import Foundation

class Session {
    private init() {}
    
    static let instance = Session()
    
    var token: String = ""
    var appID: String = "8005661"
}
