////
////  CacheManager.swift
////  Github followers
////
////  Created by Meruert on 30.04.2023.
////
//
//import UIKit
//
//struct CacheManager {
//    static let shared = CacheManager()
//    let cache = NSCache<NSString, UIImage>()
//    
//    func downloadImage(from urlString: String) {
//        
//        let cacheKey = NSString(string: urlString)
//        
//        if let image = cache.object(forKey: cacheKey) {
//            self.image = image
//            return
//        }
//        
//        guard let url = URL(string: urlString) else { return }
//        
//        // create task
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            guard let self = self else { return }
//        
//            // handling errors
//            if error != nil { return }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
//            guard let data = data else { return }
//            
//            
//            guard let image = UIImage(data: data) else { return }
//            self.cache.setObject(image, forKey: cacheKey)
//            
//            DispatchQueue.main.async {
//                self.image = image
//            }
//            
//            
//        }
//        task.resume()
//        
//    }
//    
//}
