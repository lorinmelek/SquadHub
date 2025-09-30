//
//  TabBarView.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

protocol TabBarViewDelegate: AnyObject {
    func tabBarView(_ tabBarView: TabBarView, didSelectTabAt index: Int)
}

final class TabBarView: UIView {
    
    @IBOutlet private weak var homeButton: UIButton!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var favoritesButton: UIButton!
    @IBOutlet private weak var teamsButton: UIButton!
    
    weak var delegate: TabBarViewDelegate?
    private var selectedIndex: Int = 0
    private var buttons: [UIButton] = []
    
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
    
    private func setupUI() {
        buttons = [homeButton, searchButton, favoritesButton, teamsButton]
        
        let icons = ["house.fill", "magnifyingglass", "star.fill", "person.3.fill"]
        
        for (index, button) in buttons.enumerated() {

            let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
            let image = UIImage(systemName: icons[index], withConfiguration: config)
            
            button.setImage(image, for: .normal)
            button.setTitle("", for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        }
        
        selectTab(at: 0)
    }
    
    @objc private func tabButtonTapped(_ sender: UIButton) {
        selectTab(at: sender.tag)
        delegate?.tabBarView(self, didSelectTabAt: sender.tag)
    }
    
    func selectTab(at index: Int) {
        guard index < buttons.count else { return }
        buttons[selectedIndex].tintColor = .gray
        selectedIndex = index
    }
}
