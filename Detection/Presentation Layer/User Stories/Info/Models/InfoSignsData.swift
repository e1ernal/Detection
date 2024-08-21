//
//  InfoSignsData.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import Foundation

struct InfoSignsData {
    let rows: [InfoSignData]
    
    init() {
        self.rows = [
            InfoSignData(title: "Entry is prohibited",
                         subtitle: "Restricts entry to a certain part of the roadway for all vehicles, with the exception of shuttle buses and taxis",
                         image: "no_entry.png"),
            InfoSignData(title: "Parking",
                         subtitle: "A sign, within the public right-of-way or adjacent thereto, that directs motorists to parking facilities",
                         image: "parking.png"),
            InfoSignData(title: "Pedestrian crossing",
                         subtitle: "A special place in a road where traffic must stop to allow people to walk across",
                         image: "crosswalk.png"),
            InfoSignData(title: "Priority road",
                         subtitle: "A road which is sign-posted as the priority road and on which moving vehicles are given way by those approaching from other directions when passing intersections",
                         image: "main_road.png"),
            InfoSignData(title: "Stopping is prohibited",
                         subtitle: "Drivers must not stop their vehicles in the area shown on the sign",
                         image: "no_stop.png")
        ]
    }
}
