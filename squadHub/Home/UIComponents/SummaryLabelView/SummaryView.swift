//
//  SummaryLabelView.swift
//  SquadHub
//
//  Created by LORIN VURAL on 26.09.2025.
//

import UIKit

final class SummaryView: UIView {
    
    @IBOutlet private weak var summaryLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        
        setupUI()
    }
    
    private func setupUI() {}
    
    func configure(teamCount: Int, totalMembers: Int) {
        summaryLabel.text = "\(teamCount) Ekip | \(totalMembers) Üye"
    }
}
