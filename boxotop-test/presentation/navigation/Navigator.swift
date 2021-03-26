//
//  Navigator.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2020.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

protocol Navigator {
    associatedtype Destination

    func navigate(to destination: Destination)
}
