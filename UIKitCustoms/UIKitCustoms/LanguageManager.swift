//
//  LanguageManager.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

public enum Languages: String {
    case english = "en"
    case arabic = "ar"
}

public class LanguageManager {
    
    private init() {}
    
    private static let userDefaults = UserDefaults.standard
    private static let appleLangKey = "AppleLanguages"
    private static let userDefLangKey = "lang"
    
    public static var appLanguage: Languages {
        get {
            let langArray = userDefaults.object(forKey: appleLangKey) as! NSArray
            let current = langArray.firstObject as! String
            return Languages(rawValue: current) ?? .english
        }
        set {
            userDefaults.set([newValue.rawValue, appLanguage.rawValue], forKey: appleLangKey)
            userDefaults.set(newValue.rawValue, forKey: userDefLangKey)
            Bundle.setLanguage(newValue.rawValue)
            userDefaults.synchronize()
            switch newValue {
            case .english:
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
            case .arabic:
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
            }
            
        }
    }
    
}
