//
//  EventsView.swift
//  Event Countdown
//
//  Created by Duong Hai Long on 2/1/24.
//

import Foundation
import SwiftUI


class EventList: ObservableObject {
    @Published var events: [Event] = []
}

struct EventsView: View {
    @State private var path = NavigationPath()

    @ObservedObject var eventList = EventList()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(eventList.events) { event in
                    NavigationLink(value: Mode.edit(event)) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: { indexSet in
                    eventList.events.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Events")
            .toolbar {
                NavigationLink(value: Mode.add) {
                    Image(systemName: "plus")
                }
            }
            .navigationDestination(for: Mode.self) { mode in
                switch(mode) {
                case let .edit(event):
                    EventForm(path: $path, events: $eventList.events, mode: .edit(event), event: event)
                case .add:
                    EventForm(path: $path, events: $eventList.events, mode: .add, event: Event())
                }

            }
        }

    }
}


#Preview {
    EventsView()
}

