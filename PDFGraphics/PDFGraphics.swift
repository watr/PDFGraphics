//
//  PDFGraphics.swift
//  Dicon
//
//  Created by HASHIMOTO Wataru on 2018/10/08.
//  Copyright © 2018 HASHIMOTO Wataru. All rights reserved.
//

import Foundation
import Quartz

public func PDFGraphics(with size: CGSize,
                render: ((CGContext) -> Void)) -> Data {
    let pdfData = NSMutableData()
    var mediaBox =  CGRect(x: 0, y: 0, width: size.width, height: size.height)
    let consumer = CGDataConsumer(data: pdfData)!
    let context = CGContext(consumer: consumer, mediaBox: &mediaBox, nil)!
    
    context.saveGState()
    context.beginPDFPage(nil)
    
    render(context)
    
    context.endPDFPage()
    context.closePDF()
    context.restoreGState()
    
    return pdfData as Data
}
