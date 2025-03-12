//
//  SettingsModel.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

struct SettingsSection {
    let title: String
    let items: [SettingsItem]
}

struct SettingsItem {
    let title: String
    let icon: UIImage?
    let iconTintColor: UIColor
    let actionType: SettingsActionType
}

enum SettingsActionType {
    case system
    case security
    case preferences
    case notifications
    case legal
    case support
    case logout
    case other(action: () -> Void)
}

