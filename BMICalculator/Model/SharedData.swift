//
//  SharedData.swift
//  BMICalculator
//
//  Created by 掛川優希 on 2/19/19.
//  Copyright © 2019 Yuki Kakegawa. All rights reserved.
//

import Foundation
import RealmSwift

class SharedData: Object {
    
    @objc dynamic var usersHeight: Double = 0.0
    @objc dynamic var usersWeight: Double = 0.0
    @objc dynamic var usersBMI: String = ""
//    var parentCategory = LinkingObjects(fromType: ListOfData.self, property: "newValues")
        
//    @objc dynamic var bmiValue = [Double]()

}

class ListOfData: Object {
    @objc dynamic var date: Date?
    let newValues = List<SharedData>()

}


