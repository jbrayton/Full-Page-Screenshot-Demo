//
//  ScreenshotDelegate.swift
//  Full Page Screenshot Demo
//
//  Created by John Brayton on 11/12/20.
//

import Foundation
import UIKit
import WebKit

class ScreenshotServiceDelegate : NSObject, UIScreenshotServiceDelegate {
    
    let viewController: ViewController
    
    init( viewController: ViewController ) {
        self.viewController = viewController
    }
    
    func screenshotService(_ screenshotService: UIScreenshotService, generatePDFRepresentationWithCompletion completionHandler: @escaping (Data?, Int, CGRect) -> Void) {
        guard let webView = self.viewController.webView else {
            completionHandler(nil, 0, CGRect(x: 0, y: 0, width: 0, height: 0))
            return
        }
        
        let pdfData = self.createPdf(forWebView: webView)
        completionHandler(pdfData, 0, CGRect.zero)
    }
    
    private func createPdf( forWebView webView: WKWebView ) -> Data {
        let pointsPerInch: CGFloat = 72
        let pageWidthInches: CGFloat = 8.5
        let pageHeightInches: CGFloat = 11
        let marginInches: CGFloat = 1.0
        let marginPoints: CGFloat = pointsPerInch * marginInches
        
        let pageSize = CGSize(width: pageWidthInches*pointsPerInch, height: pageHeightInches*pointsPerInch)
        let pageRect = CGRect(origin: CGPoint.zero, size: pageSize)
        let marginRect = pageRect.insetBy(dx: marginPoints, dy: marginPoints)
        
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(webView.viewPrintFormatter(), startingAtPageAt: 0)
        render.setValue(NSValue(cgRect: pageRect),   forKey:"paperRect")
        render.setValue(NSValue(cgRect: marginRect), forKey: "printableRect")
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, pageRect, nil)
        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage();
            let bounds = UIGraphicsGetPDFContextBounds()
            render.drawPage(at: i, in: bounds)
        }
        UIGraphicsEndPDFContext();
        return pdfData as Data
    }

}
