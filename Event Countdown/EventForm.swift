//
//  EventForm.swift
//  Event Countdown
//
//  Created by Duong Hai Long on 2/1/24.
//

import Foundation
import SwiftUI

struct EventForm: View {

    @Binding var path: NavigationPath
    @Binding var events: [Event]
    let mode: Mode
    
    @State var event: Event
    
    @State private var emptyTitle = false
        
    func onSave() {
        if event.title.isEmpty {
            emptyTitle = true
            return
        }
        
        switch(mode) {
        case .add:
            $events.wrappedValue.append(self.event)
        case let .edit(editedEvent):
            if let index = $events.wrappedValue.firstIndex(of: editedEvent) {
                $events.wrappedValue[index] = event
            }
        }
        
        path.removeLast()
    }
    
    var body: some View {
        let eventTitle = switch(mode) {
        case .add:
            "Add Event"
        case let .edit(editedEvent):
            "Edit \(editedEvent.title)"
        }
        
        NavigationView {
            Form {
                Section {
                    TextField("Event Title", text: $event.title).foregroundColor(event.textColor)
                    DatePicker("Date", selection: $event.date)
                    ColorPicker("Color", selection: $event.textColor)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(eventTitle)
        }
        .toolbar {
            Button {
                onSave()
            } label: {
                Text("Save")
            }
        }
        .alert(isPresented: $emptyTitle) {
            Alert(
                title: Text("Empty event title"),
                message: Text("The event title is empty. Please give the event a title!")
            )
        }
    }
}
