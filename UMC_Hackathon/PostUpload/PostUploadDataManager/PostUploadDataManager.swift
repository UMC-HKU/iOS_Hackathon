//
//  PostUploadDataManager.swift
//  UMC_Hackathon
//
//  Created by Jong on 2022/07/01.
//

import Foundation
import Alamofire

class PostUploadDataManager {
    func posts(_ viewController: PostUploadViewController, _ parameter: PostUploadInput) {
        AF.request(
            "https://cb45-219-250-81-217.jp.ngrok.io/posts",
            method: .post,
            parameters: parameter,
            encoder: JSONParameterEncoder.default,
            headers: nil)
            .validate()
            .responseDecodable(of: PostUploadModel.self) {
                response in switch response.result {
                case .success(let result):
                    if result.isSuccess {
                        print("Success")
                    } else {
                        print(result.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
