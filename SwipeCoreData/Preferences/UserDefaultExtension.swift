//
//  UserDefaultExtension.swift
//  Swap Clothes
//
//  Created by Iliane Zedadra on 23/03/2021.
//

import Foundation

extension UserDefaults {
   enum Keys: String {
       case tshirt, chemise, jupe, pantalon, km, username, location
   }
}

extension UserDefaults {
   static var tshirt: Bool {
       get {
        return UserDefaults.standard.bool(forKey: Keys.tshirt.rawValue) 
       }
       set {
           return UserDefaults.standard.set(newValue, forKey: Keys.tshirt.rawValue)
       }
   }
   static var chemise: Bool {
       get {
        return UserDefaults.standard.bool(forKey: Keys.chemise.rawValue) 
       }
       set {
           return UserDefaults.standard.set(newValue, forKey: Keys.chemise.rawValue)
       }
   }
   static var jupe: Bool {
       get {
        return UserDefaults.standard.bool(forKey: Keys.jupe.rawValue) 
       }
       set {
           return UserDefaults.standard.set(newValue, forKey: Keys.jupe.rawValue)
       }
   }
   static var pantalon: Bool {
       get {
        return UserDefaults.standard.bool(forKey: Keys.pantalon.rawValue)
       }
       set {
           return UserDefaults.standard.set(newValue, forKey: Keys.pantalon.rawValue)
       }
   }
   static var km: Double {
       get {
           return UserDefaults.standard.double(forKey: Keys.km.rawValue)
       }
       set {
           return UserDefaults.standard.set(newValue, forKey: Keys.km.rawValue)
       }
    
   }
    static var username: String {
            get {
                return UserDefaults.standard.string(forKey: Keys.username.rawValue) ?? ""
            }
            set {
                return UserDefaults.standard.set(newValue, forKey: Keys.username.rawValue)
            }
        }
        static var location: String {
            get {
                return UserDefaults.standard.string(forKey: Keys.location.rawValue) ?? ""
            }
            set {
                return UserDefaults.standard.set(newValue, forKey: Keys.location.rawValue)
            }
        }
}
