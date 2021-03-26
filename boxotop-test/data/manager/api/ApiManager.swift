//
//  ApiManager.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import RxSwift

protocol ApiManager {
    func getMovies(search: String) -> Single<[MovieSearchEntity]>
}

