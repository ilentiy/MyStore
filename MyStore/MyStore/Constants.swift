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
    static let preson = "person.circle.fill"
    static let badge = "app.badge"
}

/// Текст кнопок
enum ButtonsTitle {
    static let clear = "Очистить"
    static let addBasket = "Добавить в корзину"
    static let showAll = "Показать всё"
}

/// Текст лэйблов
enum LabelTexts {
    static let whatsNew = "Вот что нового"
    static let recomend = "Рекомендуется Вам"
    static let devices = "Ваши устройства"
    static let getNews = "Получайте новости о своем заказе в режиме реального времени."
    static let orderNews = "Включите уведомления, чтобы получать новости о своем заказе."
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
    static let airpods = "airpods"
}

/// Ссылки на рестор
enum ProductsURL {
    static let blackCase = "https://re-store.ru/catalog/P058-110-15/"
    static let brownCase = "https://re-store.ru/catalog/PA15DACH5449/"
    static let watchStrap = "https://re-store.ru/catalog/MJ4V3ZM-A/"
    static let restore = "re-store.ru"
}

///  Системные названия кнопок для тул бара
enum BarButtonImageName {
    static let back = "chevron.backward"
    static let forward = "chevron.forward"
    static let reload = "arrow.clockwise"
    static let share = "square.and.arrow.up"
}

/// Прогресс заказа
enum OrderViewText {
    enum Progress {
        static let firstStage = "Обрабатывается"
        static let secondStage = "Отправлено"
        static let thirdStage = "Доставлено"
    }
    
    enum Info {
        static let status = "Ваш заказ отправлен."
        static let detail = "1 товар, доставка завтра"
    }
    
}

/// КОнстанты для работы с вебкит
enum FilesURLs {
    static let fileName = "file"
    static let fileExtension = "pdf"
}

/// Ключи
enum Keys {
    static let avatar = "avatar"
}
