//
//  ConvertDateToString.swift
//  Messaging
//
//  Created by Connie Liu on 7/27/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import Foundation
import CoreData

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
