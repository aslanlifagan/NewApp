//
//  CustomUITextField.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import UIKit


@IBDesignable public class CustomUITextField: UITextField {
    
    
    @IBInspectable public var placeholderColor: UIColor = UIColor.clear {
        didSet {
            guard let placeholder = placeholder else { return }
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
            layoutSubviews()
            
        }
    }
    
    @IBInspectable public var leftPadding: CGFloat = 0 {
        didSet {
            let padding = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 0))
            
            leftViewMode = UITextField.ViewMode.always
            leftView = padding
        }
    }
    @IBInspectable var leftText: String? {
        didSet {
            if let text = leftText {
                leftViewMode = .always
                
                let label = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.width * 0.2, height: self.frame.height / 2))
                label.text = text
                label.font = self.font
                label.textColor = self.textColor
                let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width * 0.2, height: self.frame.height / 2))
                view.addSubview(label)
                leftView = view
            } else {
                leftViewMode = .never
            }
        }
    }
}
