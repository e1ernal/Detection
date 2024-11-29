//
//  SignModel.swift
//  Detection
//
//  Created by e1ernal on 22.11.2024.
//

import UIKit

struct Sign {
    let title: String
    let subtitle: String
    let image: String
    let label: String
    let recommendation: String
    let tip: String
    
    init(title: String, subtitle: String, image: String, label: String, recommendation: String, tip: String) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.label = label
        self.recommendation = recommendation
        self.tip = tip
    }
}

extension Sign {
    static func sign1() -> Sign {
        Sign(title: "Parking",
             subtitle: "Indicates the place where parking is allowed. Drivers can safely leave their cars without fear of a parking fine",
             image: "1.png",
             label: "parking",
             recommendation: "• Use designated parking spaces to avoid fines\n• Make sure your car does not obstruct other vehicles or pedestrians.",
             tip: "Always check for time restrictions on parking signs to avoid fines. Use parking apps to find available spots nearby")
    }
    
    static func sign2() -> Sign {
        Sign(title: "Traffic is prohibited",
             subtitle: "Prohibits the movement of all vehicles in this direction, that is, cars, with the exception of public transport and cars that transport people with disabilities.\n\nThe validity of the sign does not apply:\n• For vehicles of federal postal service organizations having a white diagonal stripe on a blue background on the side surface.\n• Vehicles that serve enterprises located in the designated area, as well as serve citizens or belong to citizens living or working in the designated area.\n• On vehicles operated by disabled persons of groups 1 and 2, transporting such disabled persons or children with disabilities.\n• For fixed-route vehicles.\n\nValid until the first intersection",
             image: "2.png",
             label: "traffic_prohibited",
             recommendation: "• Do not proceed in the direction indicated by the sign\nIf you are already on this section of the road, find a safe place to turn around",
             tip: "If you see this sign, look for alternative routes. Ignoring it can lead to fines and traffic violations")
    }
    
    static func sign3() -> Sign {
        Sign(title: "Main road",
             subtitle: "A road on which the right of preferential passage of unregulated intersections is granted. The sign helps to navigate difficult intersections and indicates the places where the main road changes its direction.\n\nThe sign is installed at the beginning of a road section with a preferential right of way for unregulated intersections. In populated areas, a sign is installed in front of every intersection on the main road. In front of unregulated intersections where the main road runs in a straight direction and the intersecting road has no more than four lanes, it is allowed to install a 350×350 mm sign. In populated areas, the sign is not allowed to be installed on the opposite side of the junction before the junction of the secondary road to the main one\n\nThe sign 2.1 with the sign 8.13 is installed in front of intersections where the main road changes direction, as well as in front of intersections with a complex layout.\n\nIn populated areas, sign 2.1 with plate 8.13 is installed in front of the intersection, and outside populated areas — previously at a distance of 150-300 m before the intersection and in front of the intersection. At intersections of roads with several carriageways, the sign is installed in front of intersections of carriageways, where an ambiguous definition of the primacy of roads is possible. Cancelled by the sign 2.2.",
             image: "3.png",
             label: "main_road",
             recommendation: "• Ensure that other drivers yield to you\n• Be cautious at intersections with secondary roads",
             tip: "When approaching a main road, be aware of increased traffic flow and adjust your speed accordingly")
    }
    
    static func sign4() -> Sign {
        Sign(title: "Pedestrian crossing",
             subtitle: "Tells pedestrians where they can cross the road, and makes it clear to drivers that they need to slow down and be careful.\n\nThe 5.19.1 sign is installed to the right of the road, the 5.19.2 sign is on the left. On roads with a structurally allocated dividing strip(s), signs 5.19.1 and 5.19.2 are installed on the dividing strip, respectively, to the right or left of each carriageway, while the sign 5.19.1 is installed on such a dividing strip if pedestrian traffic along the carriageway is organized along it or a pedestrian crossing crosses two or more dividing strips",
             image: "4.png",
             label: "pedestrian_crossing",
             recommendation: "• Reduce speed and be ready to stop if pedestrians are at the crossing\n• Pay attention to pedestrians who may appear unexpectedly",
             tip: "Always slow down and be prepared to stop when approaching a pedestrian crossing, even if no one is visible")
    }
    
    static func sign5() -> Sign {
        Sign(title: "Pedestrian traffic is prohibited",
             subtitle: "Prohibits the movement of pedestrians on the side of the road on which it is installed. As a rule, it can be found where the appearance of pedestrians is dangerous and can interfere with the movement of vehicles. Such places include bridges, overpasses, tunnels, and roadsides.\n\nThe sign is installed in places where the movement of pedestrians is unacceptable due to their safety conditions (artificial structures that do not have sidewalks, road sections under repair, etc.).\n\nThe sign is installed on the side of the road on which the prohibition is imposed.The sign may be used to prohibit crossing at regulated intersections where any directions of pedestrian movement are prohibited.\n\nThe sign is placed on the edge of the sidewalk facing pedestrians, whose movement should be prohibited.Valid until the first intersection",
             image: "5.png",
             label: "pedestrian_traffic_prohibited",
             recommendation: "• Do not allow pedestrians to walk in this section of the road\n• Ensure they cross at designated areas",
             tip: "Avoid walking in areas marked with this sign to ensure your safety and compliance with traffic laws")
    }
    
    static func sign6() -> Sign {
        Sign(title: "Turning to the right is prohibited",
             subtitle: "It is forbidden for cars to turn right at the intersection. The sign does not apply to fixed-route vehicles. It can be found on the roads to the bus station, gas station and one-way traffic",
             image: "6.png",
             label: "turning_right_prohibited",
             recommendation: "• Do not turn right at this intersection\n• Find an alternative route",
             tip: "Plan your route in advance to avoid last-minute lane changes if you encounter this sign")
    }
    
    static func sign7() -> Sign {
        Sign(title: "Turning to the left is prohibited",
             subtitle: "It is forbidden for cars to turn left at the intersection. The movement can be continued in other directions. The sign does not apply to fixed-route vehicles. It can be found on the roads to the bus station, gas station and one-way traffic",
             image: "7.png",
             label: "turning_left_prohibited",
             recommendation: "• Do not turn left at this intersection\n• Use other routes to reach your destination",
             tip: "Look for designated left turn lanes or alternative routes to reach your destination")
    }
    
    static func sign8() -> Sign {
        Sign(title: "U-turn is prohibited",
             subtitle: "It is forbidden for cars to turn around on the specified road section. The sign does not apply to fixed-route vehicles. It is installed directly in front of the intersection, where such a maneuver will create a special danger for the movement of other road users",
             image: "8.png",
             label: "u_turn_prohibited",
             recommendation: "• Do not make a U-turn on this section of the road\n• Find a safe place to turn around if necessary",
             tip: "If you need to turn around, find the nearest safe location to do so legally")
    }
    
    static func sign9() -> Sign {
        Sign(title: "Maximum speed limit",
             subtitle: "It is forbidden to drive at a speed higher than that indicated on the sign, otherwise it may lead to an accident on the road.\n\nThe sign 3.24 can act not only as forbidding, but also as permissive. So, in populated areas, the maximum speed should not exceed 60 km/h, however, signs 3.24 may be installed on major urban highways (highways, avenues, large streets), increasing the permitted maximum speed to 80 km/h or more.\n\nThe sign 3.24 with the plate 8.2.1 in front of the artificial irregularity is installed together with the sign 5.20 on the same support.\n\nValid until the first intersection, or up to signs 3.25 or 3.31, as well as up to sign 3.24 with a different numeric value",
             image: "9.png",
             label: "maximum_speed_limit",
             recommendation: "• Adhere to the specified speed limit\n• Ensure your speed is appropriate for road conditions",
             tip: "Always adhere to the posted speed limit, and be mindful of changing limits in construction zones or residential areas")
    }
    
    static func sign10() -> Sign {
        Sign(title: "Parking is prohibited",
             subtitle: "Parking of vehicles is prohibited. It does not apply to vehicles operated by disabled people of groups I and II, transporting such disabled people and children with disabilities, if the vehicle has an identification mark 'Disabled'",
             image: "10.png",
             label: "parking_prohibited",
             recommendation: "• Do not leave your vehicle in this section of the road\n• Find an alternative parking location",
             tip: "Look for nearby legal parking options to avoid fines. If you must stop, ensure it's in a designated area")
    }
    
    static func sign11() -> Sign {
        Sign(title: "The stop is prohibited",
             subtitle: "It is prohibited to stop and park vehicles.The sign does not apply to fixed-route vehicles and vehicles used as passenger taxis in places where fixed-route vehicles stop or vehicles used as passenger taxis are parked, marked with markings 1.17.1 and (or) signs 5.16, 5.17, 5.18, respectively[8]",
             image: "11.png",
             label: "stop_prohibited",
             recommendation: "• Do not stop in this section of the road, even for a short time\n• If you need to stop, find a safe place",
             tip: "Keep moving when you see this sign, but stay alert for pedestrians or cyclists")
    }
    
    static func sign12() -> Sign {
        Sign(title: "Entry is prohibited",
             subtitle: "Prohibits the movement of all vehicles in this direction, which means that drivers should look for another route.\n\nThe sign is installed at the entrance to recreation areas, gas stations and one-way roads.\n\nValid until the first intersection. The common name of the sign is 'brick'.The sign 3.1 can be used in conjunction with the plates 8.4.1—8.4.8, 8.5.1, 8.5.2, 8.5.3, 8.5.4—8.5.7 and 8.4.9—8.4.16",
             image: "12.png",
             label: "entry_prohibited",
             recommendation: "• Do not enter the area where this sign is posted\n• Pay attention to alternative routes",
             tip: "Respect this sign to avoid legal issues. Look for alternative routes to your destination")
    }
    
    static func sign13() -> Sign {
        Sign(title: "Moving straight",
             subtitle: "Traffic is allowed only straight ahead. If installed at the beginning of the road section, it is valid to the nearest intersection, while turning right into the courtyards is allowed",
             image: "13.png",
             label: "moving_straight",
             recommendation: "• Continue in the indicated direction\n• Ensure there are no obstacles in your path",
             tip: "Stay in your lane and be mindful of other drivers who may be changing lanes")
    }
    
    static func sign14() -> Sign {
        Sign(title: "Moving to the right",
             subtitle: "Allows drivers to move in the specified direction, that is, to the right.The sign does not apply to fixed-route vehicles such as buses, trolleybuses and minibuses",
             image: "14.png",
             label: "moving_right",
             recommendation: "• If you are going to turn right, ensure it is safe\n• Yield to pedestrians and other vehicles",
             tip: "Use your turn signal well in advance to indicate your intention to move right")
    }
    
    static func sign15() -> Sign {
        Sign(title: "Moving to the left",
             subtitle: "Allows drivers to move in the specified direction, i.e. left or U-turn.The sign does not apply to fixed-route vehicles such as buses, trolleybuses and minibuses",
             image: "15.png",
             label: "moving_left",
             recommendation: "• If you are going to turn left, ensure it is safe\n• Yield to oncoming traffic",
             tip: "Check your mirrors and blind spots before changing lanes to the left")
    }
    
    static func sign16() -> Sign {
        Sign(title: "Moving straight or to the right",
             subtitle: "Allows drivers to drive only in two directions: straight or right",
             image: "16.png",
             label: "moving_straight_or_right",
             recommendation: "• You may proceed in either direction\n• Ensure your actions are safe for other road users",
             tip: "Be prepared to yield to pedestrians if you're turning right at an intersection")
    }
    
    static func sign17() -> Sign {
        Sign(title: "Moving straight or to the left",
             subtitle: "Indicates to the driver in which direction it is possible to move, in this case it is allowed to continue driving straight or to the left, as well as a U-turn. Turning to the right is prohibited",
             image: "17.png",
             label: "moving_straight_or_left",
             recommendation: "• You may proceed in either direction\n• Watch for signs and traffic lights",
             tip: "If you plan to go straight, keep an eye on left-turning traffic to avoid collisions")
    }
    
    static func sign18() -> Sign {
        Sign(title: "Moving to the right or to the left",
             subtitle: "It is used to allow movement in the directions indicated by the arrows. This sign also permits U-turns and does not apply to fixed-route vehicles",
             image: "18.png",
             label: "moving_right_or_left",
             recommendation: "• You may proceed in either direction\n• Ensure you do not obstruct other road users",
             tip: "Be cautious of cyclists when making turns; always check your surroundings")
    }
    
    static func sign19() -> Sign {
        Sign(title: "Detour the obstacle on the right",
             subtitle: "Indicates to the driver which side to avoid obstacles on the road, in this case it should be on the right",
             image: "19.png",
             label: "detour_obstacle_right",
             recommendation: "• Bypass the obstacle on the right with caution\n• Ensure there is no oncoming traffic",
             tip: "Slow down and signal your intent to move around the obstacle safely")
    }
    
    static func sign20() -> Sign {
        Sign(title: "Detour the obstacle on the left",
             subtitle: "Indicates to the driver which side to avoid obstacles on the road, in this case it should be on the left",
             image: "20.png",
             label: "detour_obstacle_left",
             recommendation: "• Bypass the obstacle on the left with caution\n• Ensure there is no oncoming traffic",
             tip: "Watch for oncoming traffic when detouring to the left and ensure it's safe to do so")
    }
    
    static func sign21() -> Sign {
        Sign(title: "Detour obstacles on the right or left",
             subtitle: "Indicates to the driver which side to avoid obstacles on the road, in this case it should be on the right or on the left",
             image: "21.png",
             label: "detour_obstacles_right_or_left",
             recommendation: "• Choose a side to bypass depending on the situation\n• Ensure it is safe",
             tip: "Use your mirrors frequently and be aware of other vehicles as you navigate around obstacles")
    }
    
    static func sign22() -> Sign {
        Sign(title: "Circular motion",
             subtitle: "Vehicles are allowed to move only in the direction indicated by the arrows. To avoid dangerous situations, the driver, approaching a roundabout intersection, must slow down and study the traffic situation",
             image: "22.png",
             label: "circular_moving",
             recommendation: "• When entering a roundabout, yield to vehicles already inside\n• Signal your turn when exiting the roundabout",
             tip: "Yield to traffic already in the roundabout and use your turn signal when exiting")
    }
    
    static func sign23() -> Sign {
        Sign(title: "Bike path",
             subtitle: "It is used to indicate a path along which only bicycles and mopeds are allowed to move. But it must be remembered that in the absence of a footpath or sidewalk, pedestrian traffic is allowed on the bike path.",
             image: "23.png",
             label: "bike_path",
             recommendation: "• Ensure you do not block the bicycle path\n• Be cautious when crossing the bicycle path",
             tip: "Be cautious when driving near bike paths; always check for cyclists before making turns")
    }
    
    static func sign24() -> Sign {
        Sign(title: "The end of the bike path",
             subtitle: "Cancels the effect of the 'Bike path' sign",
             image: "24.png",
             label: "end_bike_path",
             recommendation: "• Be prepared for the bicycle path to end and follow traffic rules\n• Ensure that cyclists can continue safely",
             tip: "Be prepared for cyclists to transition back onto the roadway; give them space and be alert")
    }
    
    static func sign25() -> Sign {
        Sign(title: "Footpath",
             subtitle: "It is used to mark paths intended only for pedestrian traffic. The main sign is installed at the beginning of the footpath and repeated after each intersection with the road. Bicycles, cars and any other vehicles have no place on the footpath",
             image: "25.png",
             label: "footpath",
             recommendation: "• Ensure you do not block the pedestrian path\n• Be attentive to pedestrians who may cross the road",
             tip: "Watch for pedestrians, especially in busy areas, and be prepared to stop if necessary")
    }
    
    static func sign26() -> Sign {
        Sign(title: "Green traffic light",
             subtitle: "The green signal allows movement. A green flashing signal permits movement and informs that its validity period is expiring and a prohibition signal will be turned on soon (digital displays can be used to inform drivers about the time in seconds remaining until the end of the green signal)",
             image: "26.png",
             label: "green_traffic_light",
             recommendation: "• Continue moving if it is safe\n• Be cautious of pedestrians and other vehicles",
             tip: "Even with a green light, always check for pedestrians and cyclists before proceeding")
    }
    
    static func sign27() -> Sign {
        Sign(title: "Yellow traffic light",
             subtitle: "The yellow signal prohibits movement, except in cases provided for in paragraph 6.14 of the Rules, and warns of the upcoming change of signals. A yellow flashing signal permits movement and informs about the presence of an unregulated intersection or pedestrian crossing, warns of danger",
             image: "27.png",
             label: "yellow_traffic_light",
             recommendation: "• Prepare to stop if it is safe\n• If you are too close to the intersection, continue moving",
             tip: "If you see a yellow light, prepare to stop unless you are too close to the intersection to do so safely")
    }
    
    static func sign28() -> Sign {
        Sign(title: "Red traffic light",
             subtitle: "A red signal, including a flashing one, prohibits movement",
             image: "28.png",
             label: "red_traffic_light",
             recommendation: "• Stop before the stop line or traffic light\n• Ensure you do not cross the intersection until the light turns green",
             tip: "Always come to a complete stop at red lights, and check for pedestrians in the crosswalk before proceeding when the light turns green")
    }
}
