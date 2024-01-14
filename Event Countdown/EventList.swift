//
//  EventList.swift
//  Event Countdown
//
//  Created by Duong Hai Long on 2/1/24.
//

import SwiftUI

struct EventList: View {
    var body: some View {
        List {
            EventRow(event: Event(id: UUID(), title: "AAA", date: Date.now, textColor: .blue))
            EventRow(event: Event(id: UUID(), title: "BBB", date: Date.now, textColor: .blue))
        }
    }
}


#Preview {
    EventList()
}

