//
//  SummaryViewCell.swift
//  SquadHub
//
//  Created by LORIN VURAL on 24.09.2025.
//
import UIKit

import UIKit

final class HomeHeaderView: UIView {
    @IBOutlet private weak var titleLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame); configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder); configureView()
    }

    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "HomeHeaderView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configure(title: String) {
        self.titleLabel.text = title
    }
}
