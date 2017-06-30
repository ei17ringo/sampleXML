//
//  ViewController.swift
//  sampleXML
//
//  Created by Eriko Ichinohe on 2017/06/30.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {

    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myLabel2: UILabel!
    
    @IBOutlet weak var myLabel3: UILabel!
    
    @IBOutlet weak var myLabel4: UILabel!
    
    @IBOutlet weak var myLabel5: UILabel!
    
    @IBOutlet weak var myLabel6: UILabel!
    
    @IBOutlet weak var myLabel7: UILabel!
    
    @IBOutlet weak var myLabel8: UILabel!
    
    @IBOutlet weak var myLabel9: UILabel!
    
    @IBOutlet weak var myLabel10: UILabel!
    
    var myCount = 1
    
    @IBOutlet weak var txtSearchword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapReturn(_ sender: UITextField) {
    
        // XML解析実行
        //一旦1にリセット
        myCount = 1
        
        loadxml()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // XMLを解析する
    func loadxml(){
        
        //URLエンコードを行い、URLの一部を作成
        let encodedString = CFURLCreateStringByAddingPercentEscapes(
            nil,
            txtSearchword.text as CFString!,
            nil,
            "!*'();:@&=+$,/?%#[]" as CFString!,
            CFStringBuiltInEncodings.UTF8.rawValue) as String
        
        
        let url_text = "http://www.google.com/complete/search?hl=en&q="+encodedString+"&output=toolbar".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        
        
        let url = URL(string: url_text)
        
        // インターネット上のXMLを取得し、NSXMLParserに読み込む
        let parser = XMLParser(contentsOf: url!)
    
        parser?.delegate = self;
        parser?.parse()
    }
    
    // XML解析開始時に実行されるメソッド
    func parserDidStartDocument(_ parser: XMLParser) {
        print("XML解析開始しました")
    }
    
    // 解析中に要素の開始タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        print("開始タグ:" + elementName)
        
        if elementName == "suggestion"{
            print(attributeDict["data"])
            
            switch myCount {
            case 1:
                myLabel1.text = attributeDict["data"]!
            case 2:
                myLabel2.text = attributeDict["data"]!
            case 3:
                myLabel3.text = attributeDict["data"]!
            case 4:
                myLabel4.text = attributeDict["data"]!
            case 5:
                myLabel5.text = attributeDict["data"]!
            case 6:
                myLabel6.text = attributeDict["data"]!
            case 7:
                myLabel7.text = attributeDict["data"]!
            case 8:
                myLabel8.text = attributeDict["data"]!
            case 9:
                myLabel9.text = attributeDict["data"]!
            case 10:
                myLabel10.text = attributeDict["data"]!

            default:
                print(myCount)
            }
            
            myCount += 1
        }
    }
    
    // 開始タグと終了タグでくくられたデータがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("要素:" + string)
    }
    
    // 解析中に要素の終了タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("終了タグ:" + elementName)
    }
    
    // XML解析終了時に実行されるメソッド
    func parserDidEndDocument(_ parser: XMLParser) {
        print("XML解析終了しました")
    }
    
    // 解析中にエラーが発生した時に実行されるメソッド
    private func parser(parser: XMLParser, parseErrorOccurred parseError: NSError) {
        print("エラー:" + parseError.localizedDescription)
    }

}

