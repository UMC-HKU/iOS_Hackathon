//
//  PostUploadModel.swift
//  UMC_Hackathon
//
//  Created by Jong on 2022/07/01.
//


struct PostUploadModel : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: PostUploadResult
}

struct PostUploadResult : Decodable {
    var postIdx : Int
}
