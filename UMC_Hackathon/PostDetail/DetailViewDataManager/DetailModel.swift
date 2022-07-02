//
//  DetailModel.swift
//  PostView
//
//  Created by Sangchul Park on 2022/07/02.
//

struct DetailModel : Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: getPostInfo?
}

struct getPostInfo : Decodable {
    var postIdx: Int?
    var title: String?
    var content: String?
    var createdAt: String?
    var comments: [getCommentsInfo]?
}

struct getCommentsInfo : Decodable {
    var commentIdx: Int?
    var content: String?
    var createdAt: String?
}
