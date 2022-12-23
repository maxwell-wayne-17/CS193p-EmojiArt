//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Maxwell Wayne on 12/21/22.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    
    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
