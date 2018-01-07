//
//  phrases.swift
//  WhoIsJesus
//
//  Created by Jean  Carlos on 03/01/18.
//  Copyright © 2018 Jean  Carlos. All rights reserved.
//

import Foundation
import JSONJoy

struct Verse : JSONJoy {
    
    let id: Int
    let verse: String
    let book: String
    let chapterNumber: Int
    let verseBeginNumber: Int
    let verseEndNumber: Int
    
    
    init(_ decoder: JSONLoader) throws {
        id = try decoder["id"].get()
        verse = try decoder["verse"].get()
        book = try decoder["gospel"].get()
        chapterNumber = try decoder["chapter_number"].get()
        verseBeginNumber = try decoder["verse_begin"].get()
        verseEndNumber = try decoder["verse_end"].get()
    }
}
