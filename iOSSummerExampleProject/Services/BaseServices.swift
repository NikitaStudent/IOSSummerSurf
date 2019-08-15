//
//  BaseServices.swift
//  iOSSummerExampleProject
//
//  Created by Никита Кожевников on 12/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import Foundation

struct BaseServices{
    
    func getPhoto(
        onCompleted: @escaping ([PhotoEntry]) -> Void,
        onError: @escaping (Error) -> Void){
        let url = URL(string: "\(NetworkConst.baseUrl)/photos?client_id=\(NetworkConst.accessKey)")!
        let task = URLSession.shared.dataTask(with: url){ (data,response, error) in
            
            if let error = error{
                onError(error)
                return
            }
            guard let data = data,
                let photos = try? JSONDecoder().decode([PhotoEntry].self, from: data)
            else {
                    print("unadable decode data")
                    onError(NSError())
                    return
            }
            onCompleted(photos)
            
        }
        task.resume()
    }
    
    func getCollection(onCompleted: @escaping ([CollectionEntry]) -> Void, onError: @escaping (Error) -> Void){
        let url = URL(string: "\(NetworkConst.baseUrl)/collections/featured?client_id=\(NetworkConst.accessKey)")!
        let task = URLSession.shared.dataTask(with: url){ (data, _, error) in
            if let error = error{
                onError(error)
                return
            }
            guard let data = data,
                let collection = try?
                    JSONDecoder().decode([CollectionEntry].self, from: data)
                else{
                    print("unadable decode data")
                    onError(NSError())
                    return
            }
            onCompleted(collection)
            
        }
        task.resume()
    }
    
}
