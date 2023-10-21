//
//  AssistantViewModel.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import Foundation
import Alamofire

@MainActor
final class AssistantViewModel: ObservableObject {
    @Published var messages: [String] = []
    
    func respond(msg: String) async {
        let endpoint: URLConvertible = "http://127.0.0.1:8001/respond"
        let parameters: Parameters = [
            "msg": msg
        ]
        self.messages.append(msg)
        AF.request(endpoint, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: []), let jsonDict = json as? [String: Any] {
                    let reply = jsonDict["response"] as? String
                    self.messages.append(reply ?? "")
                }
            case .failure(_):
                debugPrint("Failed")
            }
        }
    }
}
