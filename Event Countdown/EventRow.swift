//
//  EventRow.swift
//  Event Countdown
//
//  Created by Duong Hai Long on 2/1/24.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    
    var body: some View {
        HStack {
            Text(event.title).foregroundStyle(event.textColor);
            Text(RelativeDateTimeFormatter().localizedString(for: event.date, relativeTo: Date.now))
        }
    }
}


#Preview {
    EventRow(event: Event(id: UUID(), title: "aaa", date: Date.now, textColor: .blue))
}
