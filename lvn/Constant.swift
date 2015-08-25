//
//  Constant.swift
//  lvn
//
//  Created by admin on 4/17/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class Constant {
    static let IS_DEBUG = true
    static let IS_CREATE_DB = false
    
    static let FILENAME_ALPHABET = "AlphabetList"
    static let FILENAME_NUMBER = "NumberList"
    
    static let FILENAME_URL_EN = "Url_en"
    static let FILENAME_URL_JA = "Url_ja"
    static let FILENAME_URL_KO = "Url_ko"
    static let FILENAME_URL_FR = "Url_fr"
    static let FILENAME_URL_RU = "Url_ru"

    
    //version DB
    static let DB_VER_EN = 1
    static let DB_VER_JA = 1
    static let DB_VER_KO = 1
    static let DB_VER_FR = 1
    static let DB_VER_RU = 1
    static let DB_VER_GR = 1
    static let DB_VER_IT = 1
    
   // ID_Storyboard
    static let ID_PHRASES_CELL = "ID_Phrases_Cell"
    static let ID_SEARCH_CELL = "ID_Search_Cell"
    static let ID_GRAMMER_CONTENT = "id_grammer_content"

     enum ContryName : String {
        case EN = "EN"
        case JA = "JA"
        case KO = "KO"
        case FR = "FR"
        case RU = "RU"
    }

    static let KEY_LANGUAGE = "key_language"
    static let KEY_COLOR = "key_color"
}
