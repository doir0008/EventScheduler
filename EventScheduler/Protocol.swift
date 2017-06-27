//
//  Protocol.swift
//  EventScheduler
//
//  Created by Ryan Doiron on 2016-11-10.
//  Copyright © 2016 doir0008@algonquinlive.com. All rights reserved.
//

import Foundation

protocol eventPassingDelegate {
    func passEventBack(newEvent: Event)
}
