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
                    NavigationLink(value: EventFormMode.edit(event)) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: { indexSet in
                    eventList.events.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Events")
            .toolbar {
                NavigationLink(value: EventFormMode.add) {
                    Label("Add", systemImage: "plus")
                }
            }
            .navigationDestination(for: EventFormMode.self) { mode in
                switch(mode) {
                case let .edit(event):
                    EventForm(mode: .edit(event), onSave:  {editedEvent in
                        if let index = eventList.events.firstIndex(of: event) {
                            eventList.events[index] = editedEvent
                        }
                        path.removeLast()
                    })
                case .add:
                    EventForm(mode: .add, onSave: {editedEvent in
                        eventList.events.append(editedEvent)
                        path.removeLast()
                    })
                }

            }
        }

    }
}


#Preview {
    EventsView()
}

