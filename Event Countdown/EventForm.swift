//
//  EventForm.swift
//  Event Countdown
//
//  Created by Duong Hai Long on 2/1/24.
//

import Foundation
import SwiftUI

struct EventForm: View {

    private let mode: EventFormMode
    private let onSave: (Event) -> Void
    
    @State private var title: String

    @State var event: Event
    
    @State private var emptyTitle = false
    
    init(mode: EventFormMode, onSave: @escaping (Event) -> Void) {
        self.mode = mode
        self.onSave = onSave

        switch mode {
        case .add:
            _title = .init(initialValue: "Add Event")
            _event = .init(initialValue: Event())
        case .edit(let editedEvent):
            _title = .init(initialValue: "Edit \(editedEvent.title)")
            _event = .init(initialValue: editedEvent)
        }
    }

    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Event Title", text: $event.title).foregroundColor(event.textColor)
                    DatePicker("Date", selection: $event.date)
                    ColorPicker("Color", selection: $event.textColor)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(title)
        }
        .toolbar {
            Button {
                onSave(event)
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
