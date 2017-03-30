//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * Communicate with the web service.
 */
class StarWarsService {
    
    static let ServerError = "ServerError"
    static let MessageLocalization = "Messages"
    
    private let parser: StarWarsParser
    
    /**
     * Initialize the service.
     */
    init() {
        parser = StarWarsParser()
    }
    
    /**
     * Get a list of films.
     */
    func getFilms(completion: @escaping (Array<Film>?, Error?) -> Void) {
        let urlString = StarWarsAPI.Server + StarWarsAPI.Version + StarWarsAPI.getFilms.url
        let serializer = AFJSONRequestSerializer()
        let request = serializer.request(withMethod: StarWarsAPI.getFilms.method, urlString: urlString, parameters: nil, error: nil)
        sendDataRequest(request: request as URLRequest) { (response, object, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            if object == nil {
                completion(nil, StarWarsServiceError.parser)
                return
            }
            let films = self.parser.parseFilms(fromObject: object!)
            if films == nil {
                completion(nil, StarWarsServiceError.parser)
                return
            }
            completion(films, nil)
            
        }
    }
    
    /**
     * Send a data request.
     */
    private func sendDataRequest(request: URLRequest, completion:@escaping (URLResponse, Any?, Error?) -> Void) {
        let config = URLSessionConfiguration.default
        let manager = AFURLSessionManager(sessionConfiguration: config)
        let task = manager.dataTask(with: request) { (response, object, error) in
            completion(response, object, error)
        }
        task.resume()
    }
}

import Foundation
import AFNetworking
