//
//  Constants.swift
//  MyStore
//
//  Created by Илья on 09.10.2022.
//

import Foundation

/// Цвет
enum Colors {
    static let element = "ElementColor"
}

/// Системные картинки
enum SystemImageNames {
    static let magnifyingGlass = "magnifyingglass"
    static let check = "checkmark.circle.fill"
    static let box = "shippingbox"
    static let heart = "heart"
    static let share = "square.and.arrow.up"
    static let laptop = "laptopcomputer.and.iphone"
    static let person = "person.crop.circle"
    static let bag = "bag"
}

/// Текст кнопок
enum TitleButtons {
    static let clear = "Очистить"
    static let addBasket = "Добавить в корзину"
}

/// Текст лэйблов
enum LabelTexts {
    static let compatible = "Совместимо с MacBook Pro - Евгений"
    static let delivery = """
    Заказ сегодня в течении дня, доставка:
    Чт 25 Фев - Бесплатно
    Варианты доставки для местоположения: 115533
"""
}
/// Информация о продуктах
enum InfoProducts {
    static let blackCase = "Чехол-конверт Pipetto для MacBook Pro 16, черный"
    static let brownCase = "Чехол-конверт DBramante1928 MODE Paris для MacBook Pro 16, кожа, коричневый"
    static let watchStrap = "Спортивный ремешок для Apple Watch 40 мм, Black Unity"
}

/// Цена продуктов
enum ProductPrice {
    static let blackCase = "4 490.00 руб."
    static let brownCase = "4 990.00 руб."
    static let watchStrap = "4 990.00 руб."
}

/// Имена изображений продуктов
enum ProductsImagesName {
    static let blackCase = ["caseBlack1", "caseBlack2", "caseBlack3"]
    static let brownCase = ["caseBrown1", "caseBrown2", "caseBrown3"]
    static let watchStrap = ["watchStrap1", "watchStrap2"]
}

/// Ссылки на рестор
enum ProductsURL {
    static let blackCase = "https://re-store.ru/catalog/P058-110-15/"
    static let brownCase = "https://re-store.ru/catalog/PA15DACH5449/"
    static let watchStrap = "https://re-store.ru/catalog/MJ4V3ZM-A/"
}

///  Системные названия кнопок для тул бара
enum BarButtonImageName {
    static let back = "chevron.backward"
    static let forward = "chevron.forward"
    static let reload = "arrow.clockwise"
    static let share = "square.and.arrow.up"
}
