//
//  Event.swift
//  Event Countdown
//
//  Created by Duong Hai Long on 2/1/24.
//

import Foundation
import SwiftUI

struct Event: Comparable, Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String = ""
    var date: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
    var textColor: Color = .black
        
    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.date < rhs.date
    }
    
}
