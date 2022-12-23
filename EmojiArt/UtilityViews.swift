//
//  UtilityViews.swift
//  EmojiArt
//
//  Created by Maxwell Wayne on 12/22/22.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        if uiImage != nil {
            Image(uiImage: uiImage!)
//                .resizable()
//                .scaledToFill()
        }
    }
}
