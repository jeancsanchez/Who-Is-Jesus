//
//  phrases.swift
//  WhoIsJesus
//
//  Created by Jean  Carlos on 03/01/18.
//  Copyright © 2018 Jean  Carlos. All rights reserved.
//

import Foundation
import Alamofire

class Verse  {
    
    private let BASE_API = "http://0.0.0.0:8000/api/verses/"
    private var randomNumber: Int = 0
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
    
    var verse: String = ""
    var book: String = ""
    var chapterNumber: Int = 0
    var verseBeginNumber: Int = 0
    var verseEndNumber: Int = 0
    var handler: (_ venda: Verse) -> ()
    
    init(randomNumber: Int, handler:@escaping (_ venda: Verse) -> ()) {
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
                        
                        if let value = response.result.value {
                            let result = value as! Verse
                            
                            self.verse = String(result.verse)
                            self.book = String(result.book)
                            self.chapterNumber = Int(result.chapterNumber)
                            self.verseBeginNumber = Int(result.verseBeginNumber)
                            self.verseEndNumber = Int(result.verseEndNumber)
                            handler(self)
                        }
                    })
            }
        }
    }
}
