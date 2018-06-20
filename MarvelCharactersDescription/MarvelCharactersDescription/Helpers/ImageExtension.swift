//
//  ImageExtension.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 13/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImage(from imageURL: String!) {
        let url = URLRequest(url: URL(string: imageURL)!)
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
    
}
