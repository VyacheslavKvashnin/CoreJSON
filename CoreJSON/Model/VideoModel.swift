//
//  VideoModel.swift
//  CoreJSON
//
//  Created by Вячеслав Квашнин on 16.07.2021.
//

import SwiftUI

struct VideoModel: Decodable, Hashable {
    var titleName: String
    var link: String
    var detail: String
    var imageLink: String
}
