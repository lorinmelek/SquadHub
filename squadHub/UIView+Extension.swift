//
//  UIView+Extension.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

extension UIView {
    func loadViewFromNib() -> UIView? {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
