//
//  NetworkManager.swift
//  Restaurant
//
//  Created by Владимир on 24.01.2022.
//

import Foundation

class NetworkManager {
    
    let baseURL = URL(string: "http://mda.getoutfit.co:8090")!
    
    func getCategories(completion: @escaping ([String]?, Error?) -> Void /* параметр который мы вызываем когда все выполнилось */) /* получить список категорий: */
        {
        let url = baseURL.appendingPathComponent("categories")
        let task =  URLSession.shared.dataTask(with: url) { /* запрос данных */
            data, _, error in
           guard let data = data /*проверяем*/ else {
               completion(nil, error)  /*если данные не прочитались*/
               return
           }
            
            let decoder = JSONDecoder() // для преобразования
            do {
                let decodedData = try decoder.decode(Categories.self, from: data)
                completion(decodedData.categories, nil) //  если скомпелировалась
            }
            catch let error /* если поймали ошибку */ {
                completion(nil, error)
            }
            
        }
        task.resume()
    }
    
    func getMenuItems(for category: String, completion: @escaping ([MenuItem]?, Error?) -> Void) /* получение айтемсменю */ {
    
        let initialUrl = baseURL.appendingPathComponent("menu")
        guard let url = initialUrl.withQueries(["category": category]) else {
                completion(nil, nil)
        return
        }
        let task = URLSession.shared.dataTask(with: url) {
           data, _, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(MenuItems.self, from: data)
                completion(decodedData.items, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
