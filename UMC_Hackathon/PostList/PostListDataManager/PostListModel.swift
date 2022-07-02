//
//  PostUploadModel.swift
//  UMC_Hackathon
//
//  Created by Jong on 2022/07/01.
//


struct PostListModel : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [PostListResult]
}

struct PostListResult : Decodable {
    var postIdx : Int
    var title : String
    var content : String
    var commentCount : Int
}
