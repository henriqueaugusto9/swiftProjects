//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Henrique Augusto on 16/02/2019.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "0c3e385b0dd819a021eb33b30aad005cf12dc35e"
    static private let publicKey = "fa931cbbfab6eac1dc120549a74ed176"
    static private let limit = 30
    
    class func loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void ){
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        let url = basePath + "offset=\(offset)%limit=\(limit)" + startsWith + getCredentials()
        print(url)
        
        AF.request(url).responseJSON { (response) in
            guard let data = response.data, let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                marvelInfo.code == 200 else {
                    onComplete(nil)
                        return
            }
            onComplete(marvelInfo)
        }
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts + privateKey + publicKey).lowercased()
        return "?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
