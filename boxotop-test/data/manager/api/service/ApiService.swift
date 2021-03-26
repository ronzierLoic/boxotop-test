//
//  ApiService.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//


import Moya
import Foundation

private enum ApiServiceValues {
    static let baseUrl = "http://www.omdbapi.com/"
    
    static let apiKey = "apikey"
    static let apiKeyValues = "93858421"
    
    static let searchKey = "s"
}

struct ApiService: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: ApiServiceValues.baseUrl)!
    }
    
    var path: String
    var method: Moya.Method
    var sampleData: Data
    var task: Task
    var headers: [String: String]?
    private(set) var validationType: ValidationType
    private(set) var authorizationType: AuthorizationType?
    
    init(
        path: String = "",
        method: Moya.Method = .get,
        task: Task = .requestPlain,
        validationType: ValidationType = .successAndRedirectCodes,
        sampleJsonString: String = "",
        headers: [String: String]? = nil,
        authorizationType: AuthorizationType = .bearer
    ) {
        self.path = path
        self.method = method
        self.sampleData = Data(sampleJsonString.utf8)
        self.task = task
        self.validationType = validationType
        self.headers = headers
        self.authorizationType = authorizationType
    }
}

extension ApiService {
    /// Retrieve movies
    /// - HTTP Method: GET
    /// - Response: [MovieResponseRemoteEntity]
    static func getMovies(search: String) -> ApiService {
        var params: [String: Any] = [:]
        params[ApiServiceValues.apiKey] = ApiServiceValues.apiKeyValues
        params[ApiServiceValues.searchKey] = search
        
        return ApiService(
            path: "",
            method: .get,
            task: .requestParameters(parameters: params, encoding: URLEncoding.default)
        )
    }
}

