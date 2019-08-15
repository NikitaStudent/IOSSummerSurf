//
//  DataProvider.swift
//  iOSSummerExampleProject
//
//  Created by Никита Кожевников on 13/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//


import CoreData

struct DataProvider{
    
    private let service:BaseServices
    private let context: NSManagedObjectContext
    
    init(service: BaseServices, context: NSManagedObjectContext){
        self.service = service
        self.context = context
    }
    
    func getCollections(
        onCompleted: @escaping ([Collection])-> Void,
        onError: @escaping ([Error])-> Void
    ) {
        service.getCollection(
            onCompleted: { (serviceCollections) in
                DispatchQueue.main.async {
                    // + 1. Из CD удаляем те коллекции, которые уже пришли из сети (для того, чтобы обновить данные)
                    self.removeNewCollections(serviceCollections: serviceCollections)
                
                    // 2. Из CD удалить те фотографии, которые уже пришли из сети
                    self.removeNewPhotos(serviceCollections: serviceCollections)

                     // 3. Заносим с CD новую информацию о коллекциях + о фото
                    self.addCollectionsAndPhotosToCD(serviceCollections: serviceCollections)
                
                    // 4. Сохраняем контекст
                    if self.context.hasChanges{
                        try? self.context.save()
                    }
                    
                    //Вызываем onCompleted
                    onCompleted(self.getAllCollectionsFromCD())
                }
            },
            onError: { (error) in
                DispatchQueue.main.async {
                    // загрузим все коллекции из Core Data
                    onCompleted(self.getAllCollectionsFromCD())
                }
            }
        )
    }
    
    func getPhotos(
        onCompleted: @escaping ([Photo]) -> Void,
        onError: @escaping (Error) -> Void){
        service.getPhoto(onCompleted: { (servicePhotos) in
            DispatchQueue.main.async {
//                self.RemoveNewPhoto(servicePhoto: servicePhotos)
                self.AddNewPhoto(servicePhotos: servicePhotos)
                if self.context.hasChanges{
                    try? self.context.save()
                }
                onCompleted(self.getAllPhotoFromCD())
                
            }
            
        },
        onError: { (error) in
            DispatchQueue.main.async {
                // загрузим все коллекции из Core Data
                onCompleted(self.getAllPhotoFromCD())
            }
        } )
    }
    
    //MARK: функции фото
    private func getAllPhotoFromCD() -> [Photo]{
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        return (try? self.context.fetch(fetchRequest)) ?? []
    }
    
    private func RemoveNewPhoto(servicePhoto: [PhotoEntry]){
        let identifiers = servicePhoto.map { $0.id }
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id in %@", argumentArray: [identifiers])
        let coreDataPhotos = (try? context.fetch(fetchRequest)) ?? []
        coreDataPhotos.forEach{ context.delete($0)}
    }
    
    private func AddNewPhoto(servicePhotos: [PhotoEntry]){
        for servicePhoto in servicePhotos{
            let coreDataPhoto = Photo(context: context)
            coreDataPhoto.id = servicePhoto.id
            coreDataPhoto.urlString = servicePhoto.urls.regular
            
            
        }
    }
    
    private func addPhotosToCD(servicePhoto: [PhotoEntry]) {
        let identifiers = servicePhoto.map { $0.id }
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id in %@", argumentArray: [identifiers])
        let coreDataPhotos = (try? context.fetch(fetchRequest)) ?? []
        coreDataPhotos.forEach { context.delete($0) }
    }
    
   
   //MARK: функции коллекций
    private func getAllCollectionsFromCD() -> [Collection]{
            let fetchRequest: NSFetchRequest<Collection> = Collection.fetchRequest()
        return (try? self.context.fetch(fetchRequest)) ?? []
        }
    
    private func removeNewCollections(serviceCollections: [CollectionEntry]){
        let identifiers = serviceCollections.map { $0.id }
        let fetchRequest: NSFetchRequest<Collection> = Collection.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id in %@", argumentArray: [identifiers])
        let coreDataCollections = (try? context.fetch(fetchRequest)) ?? []
        coreDataCollections.forEach{ context.delete($0)}
    }
    
    private func removeNewPhotos(serviceCollections: [CollectionEntry]) {
        let identifiers = serviceCollections.map { $0.cover_photo.id }
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id in %@", argumentArray: [identifiers])
        let coreDataPhotos = (try? context.fetch(fetchRequest)) ?? []
        coreDataPhotos.forEach { context.delete($0) }
    }
    
    
    private func addCollectionsAndPhotosToCD(serviceCollections: [CollectionEntry]){
        for serviceCollection in serviceCollections{
            let coreDataCollection = Collection(context: context)
            coreDataCollection.id = Int32(serviceCollection.id)
            coreDataCollection.title = serviceCollection.title
    
            let coreDataPhoto = Photo(context: context)
            coreDataPhoto.id = serviceCollection.cover_photo.id
            coreDataPhoto.urlString = serviceCollection.cover_photo.urls.regular

            coreDataCollection.photo = coreDataPhoto
    
        }
    }

}


