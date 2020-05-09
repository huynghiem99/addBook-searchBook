//
//  ViewController.swift
//  Thêm sách vào tủ,search sách
//
//  Created by macOS on 5/8/20.
//  Copyright © 2020 macOS. All rights reserved.
//

import UIKit


extension NSObject {
    class var name: String { String(describing: self) }
}

class ViewController: UIViewController {

    //outlet
    @IBOutlet weak var tbvFavouriteBook:UITableView!
    @IBOutlet weak var lblQuestion:UILabel!
    @IBOutlet weak var lblReportNumBook:UILabel!
    @IBOutlet weak var searchBook:UISearchBar!
    //var
    var arrFavouriteBook:[Book] = []
    var searchFavouriteBook:[Book] = []
    var addedBooks: [Book] = []
    var searching:Bool = false
    var bookAdded:Int = 0 {
        didSet {
            atributeStringNumBookInTotel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvFavouriteBook.dataSource = self
        tbvFavouriteBook.delegate = self
        searchBook.delegate = self
        
    
        
        initData()
        registerTableView()
        atributeString()
        atributeStringNumBookInTotel()
        
        
        
    }

    func atributeString(){
            //Bạn có những cuốn sách nào? Hãy thêm ít nhất 5 cuốn vào tủ sách của bạn!
        let textNumBook = "ít nhất \(String(arrFavouriteBook.count)) cuốn"
        let text = String(format: "Bạn có những cuốn sách nào? Hãy thêm %@ vào tủ sách của bạn!", String(textNumBook))
        let attributedString = NSMutableAttributedString(string: text, attributes: [
          .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
          .foregroundColor: #colorLiteral(red: 0, green: 0.1019607843, blue: 0.2235294118, alpha: 1)
        ])
        attributedString.addAttributes([.font: UIFont.systemFont(ofSize: 14.0, weight: .semibold) ,
                                        .foregroundColor: #colorLiteral(red: 0, green: 0.1019607843, blue: 0.2235294118, alpha: 1)], range: (text as NSString).range(of: textNumBook))
        lblQuestion.attributedText = attributedString
    }
    
    
    func atributeStringNumBookInTotel(){
        let textNumBook = "\(String(bookAdded))/"
        let text = String(format: "%@\(arrFavouriteBook.count)", String(textNumBook))
        let attributedString = NSMutableAttributedString(string: text, attributes: [
          .font: UIFont.systemFont(ofSize: 20.0, weight: .regular),
          .foregroundColor: #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
        ])
        attributedString.addAttributes([.font: UIFont.systemFont(ofSize: 20.0, weight: .regular) ,
        .foregroundColor: #colorLiteral(red: 0.3529411765, green: 0.6431372549, blue: 0.8, alpha: 1)], range: (text as NSString).range(of: textNumBook))
        lblReportNumBook.attributedText = attributedString
    }
    
    
    func initData(){
        arrFavouriteBook = [Book.init(name: "Bố con cá gai", author: "Smith", img: "book1", numReview: "18 reviews", numShare: "125", numCmt: "354"),
        Book.init(name: "Khi hơi thở hoá thinh không", author: "Green", img: "book2", numReview: "14 reviews", numShare: "135", numCmt: "154"),
        Book.init(name: "Sự im lặng của bầy cừu", author: "Rob", img: "book3", numReview: "8 reviews", numShare: "15", numCmt: "35"),
        Book.init(name: "Ba mẹ", author: "King", img: "img2360Copy", numReview: "11 reviews", numShare: "12", numCmt: "954"),
        Book.init(name: "Ba mẹ", author: "King", img: "img2360Copy", numReview: "11 reviews", numShare: "12", numCmt: "954")]
    }
    
    
    
    func registerTableView(){
        //register
        tbvFavouriteBook.register(UINib(nibName: TableViewCellBook.name, bundle: nil), forCellReuseIdentifier: "TableViewCellBook")
    }
    
}



//MARK table view book
extension ViewController: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchFavouriteBook.count
        }
        return arrFavouriteBook.count
    }
    
    
    func removeBook(_ book: Book) {
        self.addedBooks.removeAll(where: { $0.name == book.name })
        self.bookAdded = self.addedBooks.count
    }
    
    func addBook(_ book: Book) {
        self.addedBooks.append(book)
        self.bookAdded = self.addedBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellBook") as! TableViewCellBook
        
        if searching == false {
            let item = arrFavouriteBook[indexPath.row]
            cell.book = item
 //           cell.addBook = self.addedBooks.contains(where: { $0.name == item.name })
            for book in self.addedBooks where item.name == book.name {
                cell.addBook = true
            }
        }
        if searching == true {
            let item = searchFavouriteBook[indexPath.row]
            cell.book = item
            for book in self.addedBooks where item.name == book.name {
                cell.addBook = true
            }
        }
        cell.addBookAction = self.addBook
        cell.removeBookAction = self.removeBook
        return cell
    }
    
    
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}



//MARK seach bar
extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFavouriteBook = arrFavouriteBook.filter({$0.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tbvFavouriteBook.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tbvFavouriteBook.reloadData()
    }
}
