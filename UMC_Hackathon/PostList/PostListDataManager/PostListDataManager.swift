//
//  PostUploadDataManager.swift
//  UMC_Hackathon
//
//  Created by Jong on 2022/07/01.
//

import Foundation
import Alamofire

class PostListDataManager {
    func gets(_ viewController: PostListViewController) {
        AF.request(
            "https://cb45-219-250-81-217.jp.ngrok.io/posts",
            method: .get,
            parameters: nil,
            headers: nil)
            .validate()
            .responseDecodable(of: PostListModel.self) {
                response in switch response.result {
                case .success(let result):
                    if result.isSuccess {
                        viewController.successAPI(result)
                    } else {
                        print(result.message)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
