//
//  ThreadsTextFieldModifier.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import Foundation
import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.gray.opacity(0.1))
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
