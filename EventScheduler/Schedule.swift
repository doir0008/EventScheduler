//
//  Schedule.swift
//  Swift_Assignment_01
//
//  Created by Ryan Doiron on 2016-11-06.
//  Copyright © 2016 doir0008@algonquinlive.com. All rights reserved.
//


import Foundation


class Schedule {
    var eventArray: [Event] = []
    
    // return the eventArray count or return zero if empty
    var eventCount: Int {
        guard eventArray.isEmpty == false else {
            return 0
        }
        return eventArray.count
    }
    
    // append a new event to the eventArray
    func addNewEvent(title: String, description: String, dateString: String) {
        eventArray.append(Event(title: title, description: description, dateString: dateString))
    }
    
    // output all the events in the eventArray
    func outputAllEvents() -> String {
        guard eventArray.isEmpty == false else {
            let error = "Error: There are no events."
            return error
        }
        var returnStringEvents: String? = ""
        
        for event in eventArray {
            returnStringEvents?.append("\(event.getInfo()) \n\n")
        }
        return returnStringEvents!
    }
}

