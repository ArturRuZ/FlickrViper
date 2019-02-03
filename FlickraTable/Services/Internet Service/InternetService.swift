//
//  InternetService.swift
//  FlickraTable
//
//  Created by Артур on 08/01/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

class InternetService: InternetServiceInput {
    func loadData<T>(fromURL: URL?,
                     parseInto container: T.Type,
                     success: @escaping (T) -> Void,
                     failure: @escaping (Int) -> Void) where T : Codable {
        guard let url = fromURL else {
            failure(102)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let error = error else {
                if data != nil {
                    self.parse(data: data!,
                               container: container,
                               success: success,
                               failure: failure)
                } else {
                    failure(102)
                }
                return
            }
            failure(error._code)
        }
        task.resume()
    }
}

extension InternetService {
    private func parse<T>(data: Data,
                          container: T.Type,
                          success: @escaping (T) -> Void,
                          failure: (Int) -> Void) where T : Codable {
        do {
            let response = try JSONDecoder().decode(container, from: data)
            DispatchQueue.main.async {
                success(response)
            }
        } catch {
            print("error.\(error.localizedDescription)")
            failure(102)
        }
    }
}
