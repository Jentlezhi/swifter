//
//  PhotoView.swift
//  SwiftTestDemo
//
//  Created by Jentle on 2020/1/9.
//  Copyright © 2020 Jentle. All rights reserved.
//

import UIKit

class PhotoView: UIView {
    
    lazy var image: UIImage? = {
     let urlStr = "https://www.520it.com/xx.png"
     var img: UIImage?
     do{
         let url = URL(fileURLWithPath: urlStr)
         let data = try Data(contentsOf: url)
         img = UIImage(data: data)
         return img
     } catch {
         return nil
     }
    }()
    
    //相当于
    lazy var image0: UIImage? = getImage("https://www.520it.com/xx.png")
    func getImage(_ urlStr: String) -> UIImage? {
        
        var img: UIImage?
        do{
            let url = URL(fileURLWithPath: urlStr)
            let data = try Data(contentsOf: url)
            img = UIImage(data: data)
            return img
        } catch {
            return nil
        }
    }
}
