//
//  ViewController.swift
//  ZstdTest
//
//  Created by Iwanaga Reiya on 2024/05/10.
//

import UIKit
import SwiftZSTD

class ViewController: UIViewController {
    @IBOutlet weak var uncompressButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func uncompressButton(_ sender: Any) {
        print("解凍開始")
        let zstPath = URL(fileURLWithPath:"/Users/iwarei/Documents/develop/compress.zst")
        let tsvPath = URL(fileURLWithPath: "/Users/iwarei/Documents/develop/unzstd.tsv")
        
        do {
            let processor = ZSTDProcessor(useContext: true)
            let compressedData = try Data(contentsOf: zstPath)
            let decompressedData = try processor.decompressFrame(compressedData)
            try decompressedData.write(to: tsvPath)
            print("解凍完了")
        } catch {
            print("Error")
            print(error)
        }
    }
}

