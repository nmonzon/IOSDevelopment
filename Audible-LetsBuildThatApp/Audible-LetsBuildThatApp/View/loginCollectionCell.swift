//
//  loginCollectionCell.swift
//  Audible-LetsBuildThatApp
//
//  Created by mbp on 1/3/19.
//  Copyright © 2019 nextU. All rights reserved.
//

import Foundation
import UIKit

class loginCollectionCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            let imagePageArray = UIImage(named: page!.imageName )
            imagePage.image = imagePageArray
            
            let color = UIColor(white: 0.2, alpha: 1.0)
            let attributedText = NSMutableAttributedString(string: page!.title , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page?.message ?? "")", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            textViewPage.attributedText = attributedText
        }
    }
    
    var imagePage : UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.yellow
        img.image = UIImage(named: "image_cvLogin")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var separatorView: UIView = {
        let separatorV = UIView()
        separatorV.translatesAutoresizingMaskIntoConstraints = false
        separatorV.backgroundColor = UIColor(white: 0.2, alpha: 1.0)
        return separatorV
    }()
    
    let textViewPage: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "Sample text"
        tv.contentInset = UIEdgeInsets(top: 24.0, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        //adding image to cell
        setupViews()
        configureConstraints()
        
    }
    
    func setupViews(){
        self.addSubview(imagePage)
        self.addSubview(textViewPage)
        self.addSubview(separatorView)
    }
    
    func configureConstraints(){
        imagePage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imagePage.bottomAnchor.constraint(equalTo: separatorView.topAnchor).isActive = true
        imagePage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imagePage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: textViewPage.topAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        textViewPage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textViewPage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textViewPage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textViewPage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
