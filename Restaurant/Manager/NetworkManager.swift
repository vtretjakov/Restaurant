//
//  NetworkManager.swift
//  Restaurant
//
//  Created by Владимир on 24.01.2022.
//

import Foundation

class NetworkManager {
    
    let initialURL = URL(string: "http://mda.getoutfit.co:8090/categories")!
    
    func getCategories(completion: @escaping ([String]?, Error?) -> Void /* параметр который мы вызываем когда все выполнилось */) /* получить список категорий: */ {
        let url = initialURL.appendingPathComponent("categories")
        let task =  URLSession.shared.dataTask(with: url) { /* запрос данных */
            data, _, error in
           guard let data = data /*проверяем*/ else {
               completion(nil, error)  /*если данные не прочитались*/
               return
           }
            
            let decoder = JSONDecoder() // для преобразования
            do {
                let decodedData = try decoder.decode(Categories.self, from: data)
                completion(decodedData.categories, nil)
            }
            catch let error /* если поймали ошибку */ {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
