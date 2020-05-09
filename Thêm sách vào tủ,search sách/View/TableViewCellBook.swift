//
//  TableViewCellBook.swift
//  Thêm sách vào tủ,search sách
//
//  Created by macOS on 5/8/20.
//  Copyright © 2020 macOS. All rights reserved.
//

import UIKit


class TableViewCellBook: UITableViewCell {
    
    //outlet
    @IBOutlet weak var imgBook:UIImageView!
    @IBOutlet weak var lblNameBook:UILabel!
    @IBOutlet weak var lblNameAuthor:UILabel!
    @IBOutlet weak var lblNumReview:UILabel!
    @IBOutlet weak var lblNumShare:UILabel!
    @IBOutlet weak var lblNumCmt:UILabel!
    @IBOutlet weak var outletAdd: UIButton!
    @IBOutlet weak var lblDesAdd: UILabel!
    
    var addBookAction: ((Book) -> Void)?
    var removeBookAction: ((Book) -> Void)?
    
    //action
    @IBAction func actionAdd(_ sender: Any) {
        //addBook = true
        if self.addBook {
            outletAdd.setImage(UIImage.init(named: "plus"), for: .normal)
            lblDesAdd.textColor = UIColor.init(red: 90/255, green: 164/255, blue: 204/255, alpha: 1)
            lblDesAdd.text = "Thêm"
            self.removeBookAction?(self.book)                                   
        } else {
            outletAdd.setImage(UIImage.init(named: "group6"), for: .normal)
            lblDesAdd.textColor = UIColor.init(red: 90/255, green: 164/255, blue: 204/255, alpha: 1)
            lblDesAdd.text = "Đã Thêm"
            self.addBookAction?(self.book)
        }
        addBook = !addBook

        
    }
    
    //var
    var addBook:Bool = false
    var numBookAdded:Int = 0
    var book:Book! {
        didSet {
            imgBook.image = UIImage.init(named: book.img)
            lblNameBook.text = book.name
            lblNameAuthor.text = book.author
            lblNumReview.text = book.numReview
            lblNumShare.text = book.numShare
            lblNumCmt.text = book.numCmt
        }
    }
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButtonAdd()
    }
    
    
    func setupButtonAdd(){
        addBook = false
        if addBook == false {
            outletAdd.setImage(UIImage.init(named: "plus"), for: .normal)
            lblDesAdd.textColor = UIColor.init(red: 90/255, green: 164/255, blue: 204/255, alpha: 1)
            lblDesAdd.text = "Thêm"
            
        }
        if addBook == true{
            outletAdd.setImage(UIImage.init(named: "group6"), for: .normal)
            lblDesAdd.textColor = UIColor.init(red: 90/255, green: 164/255, blue: 204/255, alpha: 1)
            lblDesAdd.text = "Đã Thêm"
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
