//
//  RecognizableObjectsDataRow.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

struct RecognizableObjectsRow {
    let title: String
    let subtitle: String
    let image: String
    
    init(title: String, subtitle: String, image: String) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}

extension RecognizableObjectsRow {
    static func row1() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Parking",
                                   subtitle: "Indicates the place where parking is allowed. Drivers can safely leave their cars without fear of a parking fine",
                                   image: "1.png")
    }
    
    static func row2() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Traffic is prohibited",
                                   subtitle: "Prohibits the movement of all vehicles in this direction, that is, cars, with the exception of public transport and cars that transport people with disabilities.\n\nThe validity of the sign does not apply:\n• For vehicles of federal postal service organizations having a white diagonal stripe on a blue background on the side surface.\n• Vehicles that serve enterprises located in the designated area, as well as serve citizens or belong to citizens living or working in the designated area.\n• On vehicles operated by disabled persons of groups 1 and 2, transporting such disabled persons or children with disabilities.\n• For fixed-route vehicles.\n\nValid until the first intersection",
                                   image: "2.png")
    }
    
    static func row3() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Main road",
                                   subtitle: "A road on which the right of preferential passage of unregulated intersections is granted. The sign helps to navigate difficult intersections and indicates the places where the main road changes its direction.\n\nThe sign is installed at the beginning of a road section with a preferential right of way for unregulated intersections. In populated areas, a sign is installed in front of every intersection on the main road. In front of unregulated intersections where the main road runs in a straight direction and the intersecting road has no more than four lanes, it is allowed to install a 350×350 mm sign. In populated areas, the sign is not allowed to be installed on the opposite side of the junction before the junction of the secondary road to the main one\n\nThe sign 2.1 with the sign 8.13 is installed in front of intersections where the main road changes direction, as well as in front of intersections with a complex layout.\n\nIn populated areas, sign 2.1 with plate 8.13 is installed in front of the intersection, and outside populated areas — previously at a distance of 150-300 m before the intersection and in front of the intersection. At intersections of roads with several carriageways, the sign is installed in front of intersections of carriageways, where an ambiguous definition of the primacy of roads is possible. Cancelled by the sign 2.2.",
                                   image: "3.png")
    }
    
    static func row4() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Pedestrian crossing",
                                   subtitle: "Tells pedestrians where they can cross the road, and makes it clear to drivers that they need to slow down and be careful.\n\nThe 5.19.1 sign is installed to the right of the road, the 5.19.2 sign is on the left. On roads with a structurally allocated dividing strip(s), signs 5.19.1 and 5.19.2 are installed on the dividing strip, respectively, to the right or left of each carriageway, while the sign 5.19.1 is installed on such a dividing strip if pedestrian traffic along the carriageway is organized along it or a pedestrian crossing crosses two or more dividing strips",
                                   image: "4.png")
    }
    
    static func row5() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Pedestrian traffic is prohibited",
                                   subtitle: "Prohibits the movement of pedestrians on the side of the road on which it is installed. As a rule, it can be found where the appearance of pedestrians is dangerous and can interfere with the movement of vehicles. Such places include bridges, overpasses, tunnels, and roadsides.\n\nThe sign is installed in places where the movement of pedestrians is unacceptable due to their safety conditions (artificial structures that do not have sidewalks, road sections under repair, etc.).\n\nThe sign is installed on the side of the road on which the prohibition is imposed.The sign may be used to prohibit crossing at regulated intersections where any directions of pedestrian movement are prohibited.\n\nThe sign is placed on the edge of the sidewalk facing pedestrians, whose movement should be prohibited.Valid until the first intersection",
                                   image: "5.png")
    }
    
    static func row6() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Turning to the right is prohibited",
                                   subtitle: "It is forbidden for cars to turn right at the intersection. The sign does not apply to fixed-route vehicles. It can be found on the roads to the bus station, gas station and one-way traffic",
                                   image: "6.png")
    }
    
    static func row7() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Turning to the left is prohibited",
                                   subtitle: "It is forbidden for cars to turn left at the intersection. The movement can be continued in other directions. The sign does not apply to fixed-route vehicles. It can be found on the roads to the bus station, gas station and one-way traffic",
                                   image: "7.png")
    }
    
    static func row8() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "U-turn is prohibited",
                                   subtitle: "It is forbidden for cars to turn around on the specified road section. The sign does not apply to fixed-route vehicles. It is installed directly in front of the intersection, where such a maneuver will create a special danger for the movement of other road users",
                                   image: "8.png")
    }
    
    static func row9() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Maximum speed limit",
                                   subtitle: "It is forbidden to drive at a speed higher than that indicated on the sign, otherwise it may lead to an accident on the road.\n\nThe sign 3.24 can act not only as forbidding, but also as permissive. So, in populated areas, the maximum speed should not exceed 60 km/h, however, signs 3.24 may be installed on major urban highways (highways, avenues, large streets), increasing the permitted maximum speed to 80 km/h or more.\n\nThe sign 3.24 with the plate 8.2.1 in front of the artificial irregularity is installed together with the sign 5.20 on the same support.\n\nValid until the first intersection, or up to signs 3.25 or 3.31, as well as up to sign 3.24 with a different numeric value",
                                   image: "9.png")
    }
    
    static func row10() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Parking is prohibited",
                                   subtitle: "Parking of vehicles is prohibited. It does not apply to vehicles operated by disabled people of groups I and II, transporting such disabled people and children with disabilities, if the vehicle has an identification mark 'Disabled'",
                                   image: "10.png")
    }
    
    static func row11() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "The stop is prohibited",
                                   subtitle: "It is prohibited to stop and park vehicles.The sign does not apply to fixed-route vehicles and vehicles used as passenger taxis in places where fixed-route vehicles stop or vehicles used as passenger taxis are parked, marked with markings 1.17.1 and (or) signs 5.16, 5.17, 5.18, respectively[8]",
                                   image: "11.png")
    }
    
    static func row12() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Entry is prohibited",
                                   subtitle: "Prohibits the movement of all vehicles in this direction, which means that drivers should look for another route.\n\nThe sign is installed at the entrance to recreation areas, gas stations and one-way roads.\n\nValid until the first intersection. The common name of the sign is 'brick'.The sign 3.1 can be used in conjunction with the plates 8.4.1—8.4.8, 8.5.1, 8.5.2, 8.5.3, 8.5.4—8.5.7 and 8.4.9—8.4.16",
                                   image: "12.png")
    }
    
    static func row13() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Moving straight",
                                   subtitle: "Traffic is allowed only straight ahead. If installed at the beginning of the road section, it is valid to the nearest intersection, while turning right into the courtyards is allowed",
                                   image: "13.png")
    }
    
    static func row14() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Moving to the right",
                                   subtitle: "Allows drivers to move in the specified direction, that is, to the right.The sign does not apply to fixed-route vehicles such as buses, trolleybuses and minibuses",
                                   image: "14.png")
    }
    
    static func row15() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Moving to the left",
                                   subtitle: "Allows drivers to move in the specified direction, i.e. left or U-turn.The sign does not apply to fixed-route vehicles such as buses, trolleybuses and minibuses",
                                   image: "15.png")
    }
    
    static func row16() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Moving straight or to the right",
                                   subtitle: "Allows drivers to drive only in two directions: straight or right",
                                   image: "16.png")
    }
    
    static func row17() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Moving straight or to the left",
                                   subtitle: "Indicates to the driver in which direction it is possible to move, in this case it is allowed to continue driving straight or to the left, as well as a U-turn. Turning to the right is prohibited",
                                   image: "17.png")
    }
    
    static func row18() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Moving to the right or to the left",
                                   subtitle: "It is used to allow movement in the directions indicated by the arrows. This sign also permits U-turns and does not apply to fixed-route vehicles",
                                   image: "18.png")
    }
    
    static func row19() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Detour the obstacle on the right",
                                   subtitle: "Indicates to the driver which side to avoid obstacles on the road, in this case it should be on the right",
                                   image: "19.png")
    }
    
    static func row20() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Detour the obstacle on the left",
                                   subtitle: "Indicates to the driver which side to avoid obstacles on the road, in this case it should be on the left",
                                   image: "20.png")
    }
    
    static func row21() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Detour obstacles on the right or left",
                                   subtitle: "Indicates to the driver which side to avoid obstacles on the road, in this case it should be on the right or on the left",
                                   image: "21.png")
    }
    
    static func row22() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Circular motion",
                                   subtitle: "Vehicles are allowed to move only in the direction indicated by the arrows. To avoid dangerous situations, the driver, approaching a roundabout intersection, must slow down and study the traffic situation",
                                   image: "22.png")
    }
    
    static func row23() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Bike path",
                                   subtitle: "It is used to indicate a path along which only bicycles and mopeds are allowed to move. But it must be remembered that in the absence of a footpath or sidewalk, pedestrian traffic is allowed on the bike path.",
                                   image: "23.png")
    }
    
    static func row24() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "The end of the bike path",
                                   subtitle: "Cancels the effect of the 'Bike path' sign",
                                   image: "24.png")
    }
    
    static func row25() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Footpath",
                                   subtitle: "It is used to mark paths intended only for pedestrian traffic. The main sign is installed at the beginning of the footpath and repeated after each intersection with the road. Bicycles, cars and any other vehicles have no place on the footpath",
                                   image: "25.png")
    }
    
    static func row26() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Green traffic light",
                                   subtitle: "The green signal allows movement. A green flashing signal permits movement and informs that its validity period is expiring and a prohibition signal will be turned on soon (digital displays can be used to inform drivers about the time in seconds remaining until the end of the green signal)",
                                   image: "26.png")
    }
    
    static func row27() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Yellow traffic light",
                                   subtitle: "The yellow signal prohibits movement, except in cases provided for in paragraph 6.14 of the Rules, and warns of the upcoming change of signals. A yellow flashing signal permits movement and informs about the presence of an unregulated intersection or pedestrian crossing, warns of danger",
                                   image: "27.png")
    }
    
    static func row28() -> RecognizableObjectsRow {
        RecognizableObjectsRow(title: "Red traffic light",
                                   subtitle: "A red signal, including a flashing one, prohibits movement",
                                   image: "28.png")
    }
}
