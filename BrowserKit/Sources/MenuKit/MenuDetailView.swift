// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Common
import UIKit
import ComponentLibrary

public final class MenuDetailView: UIView,
                                   MenuTableViewDataDelegate, ThemeApplicable {
    // MARK: - UI Elements
    private var tableView: MenuTableView = .build()
    public var detailHeaderView: NavigationHeaderView = .build()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup
    private func setupView() {
        addSubview(detailHeaderView)
        addSubview(tableView)

        NSLayoutConstraint.activate([
            detailHeaderView.topAnchor.constraint(equalTo: self.topAnchor),
            detailHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: detailHeaderView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    public func setupAccessibilityIdentifiers(closeButtonA11yLabel: String,
                                              closeButtonA11yId: String,
                                              backButtonA11yLabel: String,
                                              backButtonA11yId: String) {
        detailHeaderView.setupAccessibility(closeButtonA11yLabel: closeButtonA11yLabel,
                                            closeButtonA11yId: closeButtonA11yId,
                                            backButtonA11yLabel: backButtonA11yLabel,
                                            backButtonA11yId: backButtonA11yId)
    }

    public func adjustLayout() {
        detailHeaderView.adjustLayout()
    }

    // MARK: - Interface
    public func reloadTableView(with data: [MenuSection]) {
        tableView.reloadTableView(with: data)
    }

    public func setViews(with title: String, and backButtonText: String) {
        detailHeaderView.setViews(with: title, and: backButtonText)
    }

    // MARK: - Theme Applicable
    public func applyTheme(theme: Theme) {
        backgroundColor = .clear
        tableView.applyTheme(theme: theme)
        detailHeaderView.applyTheme(theme: theme)
    }
}
