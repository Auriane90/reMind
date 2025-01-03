//
//  reTextField.swift
//  reMind
//
//  Created by Pedro Sousa on 29/06/23.
//

import SwiftUI

struct reTextField: View {
    @State var title: String = ""
    @State var caption: String = ""
    @State var maxSize: Int = 50
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) {
            if !title.isEmpty {
                Text(title)
                    .font(.body)
                    .fontWeight(.bold)
            }

            TextField("", text: $text)
                .textFieldStyle(reTextFieldStyle())
                .onChange(of: text) { newValue in
                    if text.count > maxSize {
                        self.text = String(text.prefix(maxSize))
                    }
                }

            if !caption.isEmpty {
                Text(caption)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.leading, 8)
            }
        }
        .foregroundColor(Palette.label.render)
    }
}

struct reTextField_Previews: PreviewProvider {
    static var previews: some View {
        reTextField(title: "Title",
                    caption: "caption",
                    text: .constant("Text"))
            .padding()
    }
}
