//
//  Event.swift
//  Swift_Assignment_01
//
//  Created by Ryan Doiron on 2016-11-06.
//  Copyright © 2016 doir0008@algonquinlive.com. All rights reserved.
//

import Foundation

class Event {
    var title: String?
    var description: String?
    var date: NSDate?
    
    // set the date in a particular format
    func setDate(formatedDateString: String){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        self.date = formatter.date(from: formatedDateString) as NSDate?
    }
    
    // initalize the event title, description and date
    convenience init(title: String, description: String, dateString: String) {
        self.init()
        self.title = title
        self.description = description
        setDate(formatedDateString: dateString)
    }
    
    // return the event title, description and date
    func getInfo() -> String {
        return "\(title!), \(description!), \(date!.description)"
    }
}
