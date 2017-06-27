//
//  ScheduleTableViewController.swift
//  EventScheduler
//
//  Created by Ryan Doiron on 2016-11-06.
//  Copyright © 2016 doir0008@algonquinlive.com. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController, eventPassingDelegate {
    
    let schedule = Schedule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup test data for schedule
        schedule.addNewEvent(title: "Sens vs Habs", description: "The Ottawa Senators host the Montreal Canadiens", dateString: "2016/10/19 19:00")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNewEvent" {
            let newViewController = segue.destination as? NewEventViewController
            newViewController?.delegate = self
        }
        if segue.identifier == "ShowEventInfo" {
            let infoViewController = segue.destination as? EventInfoViewController
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else {
                    return
            }
            // Pass the event object over to the viewcontroller
            infoViewController?.Event = schedule.eventArray[indexPath.row]
        }
    }
        
    @IBAction func newEventAction(_ sender: Any) {
        performSegue(withIdentifier: "ShowNewEvent", sender: self)
    }
    
    func passEventBack(newEvent: Event) {
        // Copy the date string and truncate the last 9 characters
        let tmp = newEvent.date!.description
        let truncated = String(tmp.characters.dropLast(9))
        schedule.addNewEvent(title: newEvent.title!, description: newEvent.description!, dateString: truncated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.eventCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableCell", for: indexPath)
        // Configure the cell with the title of the event
        cell.textLabel?.text = schedule.eventArray[indexPath.row].title
        return cell
    }
}
