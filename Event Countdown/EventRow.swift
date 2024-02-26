//
//  EventRow.swift
//  Event Countdown
//
//  Created by Duong Hai Long on 2/1/24.
//

import SwiftUI

struct EventRow: View {
    var event: Event

    @State private var now = Date.now
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack {
            Text(event.title).foregroundStyle(event.textColor);
            Text(RelativeDateTimeFormatter().localizedString(for: event.date, relativeTo: now)).onReceive(timer, perform: { date in
                now = date
            })
        }
    }
}


#Preview {
    EventRow(event: Event(id: UUID(), title: "aaa", date: Date.now, textColor: .blue))
}
