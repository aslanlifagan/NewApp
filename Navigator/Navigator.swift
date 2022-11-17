//
//  Navigator.swift
//  NewApp
//
//  Created by Fagan Aslanli on 14.11.22.
//

import UIKit

/**
 * If you want to add new storyboard name here,
 * you should add new case to StorboardType enum.
 * Thats all
 */

enum StoryboardType {
    case main, login
    
    func getName() -> String {
        switch self {
        case .main: return "Main"
        case .login: return "Login"
        }
    }
}

class Navigator {
    static let instance = Navigator()
    
    // MARK: - Public Functions
    public func getStoryboard(with name: StoryboardType) -> UIStoryboard {
        return UIStoryboard(name: name.getName(), bundle: nil)
    }
}
