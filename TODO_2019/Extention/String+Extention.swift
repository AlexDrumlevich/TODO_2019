//
//  String+Extention.swift
//  TODO_2019
//
//  Created by Друмлевич on 08.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//


extension String {
    var name: String {
        return components(separatedBy: "/").last ?? ""
    }
}
