//
//  PaletteEditor.swift
//  EmojiArt
//
//  Created by Maxwell Wayne on 1/21/23.
//

import SwiftUI

struct PaletteEditor: View {
    
    @Binding var palette: Palette
    
    var body: some View {
        Form {
            TextField("Name", text: $palette.name)
        }
        .frame(minWidth: 300, minHeight: 350)
    }
}

struct PaletteEditor_Previews: PreviewProvider {
    static var previews: some View {
        Text("Fix me!")
//        PaletteEditor()
            .previewLayout(.fixed(width: 300, height: 350))
    }
}
