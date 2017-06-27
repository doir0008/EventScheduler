//
//  EventInfoViewController.swift
//  EventScheduler
//
//  Created by Ryan Doiron on 2016-11-06.
//  Copyright © 2016 doir0008@algonquinlive.com. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController {

    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTextLabel: UILabel!
    var Event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(Event != nil) {
            // set the textlabels to event object details
            eventTitleLabel.text = Event?.title
            eventTextLabel.text = Event?.description
            eventDateLabel.text = Event?.date?.description
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
