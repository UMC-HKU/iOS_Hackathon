//
//  DetailDataManager.swift
//  PostView
//
//  Created by Sangchul Park on 2022/07/02.
//

import Alamofire

final class DetailDataManager {
    func getPostDetail(_ viewController: DetailViewController,
                           _ userID: Int) {
        //통신
        AF.request("https://cb45-219-250-81-217.jp.ngrok.io/posts/\(userID)",
                   method: .get,
                   parameters: nil)
            .validate()
            .responseDecodable(of: DetailModel.self) { response in
                        switch response.result {
                        case .success(let result):
                            viewController.successAPI(result)
                        case .failure(let error):
                            print(String(describing: error))
                        }
                    }
    }
    
}
