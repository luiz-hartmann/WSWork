//
//  Viewcode.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import Foundation

protocol Viewcode {
    func buildViewHierarchy()
    func addConstraints()
    func applyExtraConfiguration()
}

extension Viewcode {
    func setup() {
        buildViewHierarchy()
        addConstraints()
        applyExtraConfiguration()
    }
}
