//
//  Signs.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import Foundation

struct Sign {
    let name: String
    let definition: String
    let imageName: String

    init(name: String, definition: String, imageURL: String) {
        self.name = name
        self.definition = definition
        self.imageName = imageURL
    }
}

enum Signs {
    static func getSigns() -> [Sign] {
        let signs = [
            Sign(name: "Pedestrian crossing",
                 definition: "A special place in a road where traffic must stop to allow people to walk across",
                 imageURL: "crosswalk.png"),
            Sign(name: "Priority road",
                 definition: """
                            A road which is sign-posted as the priority road and on which moving vehicles
                            are given way by those approaching from other directions when passing intersections
                            """,
                 imageURL: "main_road.png"),
            Sign(name: "Entry is prohibited",
                 definition: """
                            Restricts entry to a certain part of the roadway for all vehicles,
                            with the exception of shuttle buses and taxis
                            """,
                 imageURL: "no_entry.png"),
            Sign(name: "Stopping is prohibited",
                 definition: "Drivers must not stop their vehicles in the area shown on the sign",
                 imageURL: "no_stop.png"),
            Sign(name: "Parking",
                 definition: """
                            A sign, within the public right-of-way or adjacent thereto,
                            that directs motorists to parking facilities
                            """,
                 imageURL: "parking.png")
        ]
        return signs.sorted { sign1, sign2 in
            sign1.name < sign2.name
        }
    }
}
