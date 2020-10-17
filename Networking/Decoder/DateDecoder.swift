//
//  DateDecore.swift
//  Networking
//
//  Created by Joan Paredes on 10/13/20.
//

import Foundation

final class DateDecoder: JSONDecoder {
    
    let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        // "2020-10-14T03:50:04.124+05:30"
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        dateDecodingStrategy = .formatted(dateFormatter)
    }
    
}
