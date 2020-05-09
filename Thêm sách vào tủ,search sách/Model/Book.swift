//
//  Book.swift
//  Thêm sách vào tủ,search sách
//
//  Created by macOS on 5/8/20.
//  Copyright © 2020 macOS. All rights reserved.
//

import Foundation

class Book {
    var name:String = ""
    var author:String = ""
    var img:String = ""
    var numReview:String = ""
    var numShare:String = ""
    var numCmt:String = ""
    
    init(name:String,author:String,img:String,numReview:String,numShare:String,numCmt:String) {
        self.name = name
        self.author = author
        self.img = img
        self.numReview = numReview
        self.numShare = numShare
        self.numCmt = numCmt
    }
}
