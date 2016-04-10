//
//  SavedPetsCollection.swift
//  Kibbl
//
//  Created by Keith Holliday on 4/9/16.
//  Copyright © 2016 Keith Holliday. All rights reserved.
//

import UIKit

class SavedPetsCollection: NSObject {
    static let sharedInstance: SavedPetsCollection = SavedPetsCollection()
    
    var savedPets = [Pet]()
    
}
