//
//  NewEventViewController.swift
//  EventScheduler
//
//  Created by Ryan Doiron on 2016-11-06.
//  Copyright © 2016 doir0008@algonquinlive.com. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {

    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventText: UITextView!
    @IBOutlet weak var eventDate: UIDatePicker!
    
    @IBOutlet weak var label: UILabel!
    
    var delegate: eventPassingDelegate?
    
    var thisEvent: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // collapse the keyboard when background touched
        eventTitle.resignFirstResponder()
        eventText.resignFirstResponder()
    }

    @IBAction func newEventButtonTapped(_ sender: Any) {
        if (eventTitle.text != "") {
            thisEvent = Event()
            thisEvent?.title = eventTitle.text
            thisEvent?.description = eventText.text
            
            // format date to string
            let date:Date = eventDate.date
            let formatter:DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm"
            let dateString:String = formatter.string(from: date)
            thisEvent?.setDate(formatedDateString: dateString)
            
            // collapse the keyboard
            eventTitle.resignFirstResponder()
            eventText.resignFirstResponder()
            
            // pass the event object back to the tableviewcontroller
            delegate?.passEventBack(newEvent: thisEvent!)
            navigationController?.popViewController(animated: true)
        }
    }
}
