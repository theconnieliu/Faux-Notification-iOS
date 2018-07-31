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
    
    func setBoundary() {
        
    }
    
//    var zeroSeconds: Date? {
//        get {
//            let calender = Calendar.current
//            let dateComponents = calender.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
////            dateComponents.second = secondInput
//            let seconds = dateComponents.second
//            return calender.date(from: dateComponents)
//        }
//    }
    
    func returnSeconds (input : String) {
        let calender = Calendar.current
        var dateComponents = calender.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
            //            dateComponents.second = secondInput
        //let seconds = dateComponents.second
       // return calender.date(from: dateComponents)
        dateComponents.second = Int(input)
    }
    
    
}
