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
        }
    }
}

struct AnimatedActionButton: View {
    var title: String? = nil
    var systemImage: String? = nil
    let action: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            if title != nil && systemImage != nil {
                Label(title!, systemImage: systemImage!)
            } else if title != nil {
                Text(title!)
            } else if systemImage != nil {
                Image(systemName: systemImage!)
            }
        }
    }
}

struct IdentifiableAlert: Identifiable {
    var id: String
    var alert: () -> Alert
}

// a button that does undo (preferred) or redo
// also has a context menu which will display
// the given undo or redo description for each

struct UndoButton: View {
    let undo: String?
    let redo: String?
    
    @Environment(\.undoManager) var undoManager
    
    var body: some View {
        let canUndo = undoManager?.canUndo ?? false
        let canRedo = undoManager?.canRedo ?? false
        if canUndo || canRedo {
            Button {
                if canUndo {
                    undoManager?.undo()
                } else {
                    undoManager?.redo()
                }
            } label: {
                if canUndo {
                    Image(systemName: "arrow.uturn.backward.circle")
                } else {
                    Image(systemName: "arrow.uturn.forward.circle")
                }
            }
                .contextMenu {
                    if canUndo {
                        Button {
                            undoManager?.undo()
                        } label: {
                            Label(undo ?? "Undo", systemImage: "arrow.uturn.backward")
                        }
                    }
                    if canRedo {
                        Button {
                            undoManager?.redo()
                        } label: {
                            Label(redo ?? "Redo", systemImage: "arrow.uturn.forward")
                        }
                    }
                }
        }
    }
}

extension UndoManager {
    var optionalUndoMenuItemTitle: String? {
        canUndo ? undoMenuItemTitle : nil
    }
    var optionalRedoMenuItemTitle: String? {
        canRedo ? redoMenuItemTitle : nil
    }
}
