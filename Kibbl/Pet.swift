//
//  Pet.swift
//  Kibbl
//
//  Created by Keith Holliday on 4/9/16.
//  Copyright © 2016 Keith Holliday. All rights reserved.
//

import UIKit

class Pet: NSObject {
    
    var name: String?
    var adoptLink: String?
    var image: String?
    
    init(name: String, adoptLink: String, image: String) {
        self.name = name
        self.adoptLink = adoptLink
        self.image = image
    }
}
