//
//  ApiManagerImpl.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import Moya
import Alamofire
import RxMoya
import RxSwift

enum ApiError: Error {
    case notFound
}

class ApiManagerImpl {
    
    private var apiProvider: MoyaProvider<ApiService>
    private var reachabilityManager: NetworkReachabilityManager?
    
    init() {
        self.apiProvider = MoyaProvider<ApiService>(plugins: [NetworkLoggerPlugin()])
    }
}

extension ApiManagerImpl: ApiManager {
    func getMovies(search: String) -> Single<[MovieSearchEntity]> {
        apiProvider
            .rx
            .request(ApiService.getMovies(search: search))
            .map(MovieSearchResponseEntity.self)
            .map({
                guard let movies = $0.moviesSearch,
                      $0.response == "True" else {
                    throw ApiError.notFound
                }
                return movies
            })
    }
    
    func getMovie(by id: String) -> Single<MovieEntity> {
        apiProvider
            .rx
            .request(ApiService.getMovie(by: id))
            .map(MovieEntity.self)
            .map({
                guard $0.response == "True" else {
                    throw ApiError.notFound
                }
                return $0
            })
    }
}
