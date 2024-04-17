//
//  AlertPopup.swift
//  CardsApp
//
//  Created by Kush Sharma on 6/04/24.
//

import SwiftUI

struct AlertPopup: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertPopup(title: Text("Server Error"),
                                        message: Text("The data received from the server is invalid."),
                                        dismissButton: .default(Text("Done")))
    
    static let invalidResponse = AlertPopup(title: Text("Server Error"),
                                            message: Text("The response received from the server is invalid."),
                                            dismissButton: .default(Text("Done")))
    
    static let invalidURL = AlertPopup(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to Server."),
                                       dismissButton: .default(Text("Done")))
    
    static let unableToProcess = AlertPopup(title: Text("Server Error"),
                                            message: Text("Unable to process the request at this time."),
                                            dismissButton: .default(Text("Done")))
}
