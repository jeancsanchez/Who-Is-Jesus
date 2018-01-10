//
//  VerseService.swift
//  WhoIsJesus
//
//  Created by Jean  Carlos on 07/01/18.
//  Copyright © 2018 Jean  Carlos. All rights reserved.
//

import Foundation
import Alamofire
import JSONJoy

class VerseService {
    
    private let BASE_API = "http://192.168.1.104:8000/api/verses"
    private let gospels = [
        0: "Mt",
        1: "Lc",
        2: "Mc",
        3: "Jo",
        4: "At",
        5: "Rom",
        6: "I Cor",
        7: "II Cor",
        8: "Gal",
        9: "Ef",
        10: "Flp",
        11: "Col",
        12: "I Tes",
        13: "II Tes",
        14: "I Tim",
        15: "II Tim"
    ]
    private var randomNumber: Int = 0
    private var handler: (_ venda: Verse) -> ()
    
    init(randomNumber: Int, handler:@escaping (_ venda: Verse) -> ()){
        self.randomNumber = randomNumber
        self.handler = handler
        
        for (index, value) in self.gospels  {
            if (index == self.randomNumber) {
                
                Alamofire.request(
                    self.BASE_API + "/filter",
                    method: .get,
                    parameters: ["gospel_key": value, "magic_number": arc4random_uniform(UInt32(1000))]
                    ).responseJSON(completionHandler: { (response) in
                        print("Request: \(String(describing: response.request))")   // original url request
                        print("Response: \(String(describing: response.response))") // http url response
                        print("Result: \(response.result)")                         // response serialization result
                        
                        switch response.result {
                        case .success: do {
                            if let result = response.result.value {
                                do {
                                    let verse = try Verse(JSONLoader(result))
                                    handler(verse)
                                } catch {
                                    print("unable to parse the JSON")
                                }
                            }
                        }
                        case .failure(let error): do {
                            print(error.localizedDescription)
                        }
                    }
                })
            }
        }
    }
}
