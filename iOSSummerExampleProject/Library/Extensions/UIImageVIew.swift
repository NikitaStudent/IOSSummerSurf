//
//  UIImageVIew.swift
//  iOSSummerExampleProject
//
//  Created by Никита Кожевников on 12/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(by urlString: String) {
        //1.проверить если ли на диске фото
        //2если есть отдать
        //3 если нет :
        //4 получиить с сервера
        //5 сохранить на диск
        let cache = URLCache.shared
        
        guard let url = URL(string: urlString) else{
            return 
        }
        
        let request = URLRequest(url: url)
        
        if let data = cache.cachedResponse(for: request)?.data {
            //данные есть на диске
            
            DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            
        } else {
            // данных нет на диске
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("error")
                    return
                }
                if
                    let data = data,
                    let response = response
                {
                    let cacheData = CachedURLResponse(response:response, data: data)
                    cache.storeCachedResponse(cacheData, for: request)
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                    
                }
                
                }.resume()
        }
        
    }
    
}
