//
//  Parser.swift
//  where-to-watch
//
//  Created by Christian Paulo on 18/10/22.
//

import Foundation

struct Parser {
    var id = 0
    func parse(comp : @escaping ([Movie]) -> ()) {
        let api = URL(string: "https://api.watchmode.com/v1/autocomplete-search/?apiKey=gWvGvybQXleyaRv2BDqw4wJBr12KgUBfPzlrtMHS&search_value=Breaking%20bad&search_type=2")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode(Welcome.self, from: data!)
                comp(result.results)
            } catch {}
           
        }.resume()
    }
    
    func idMovie() {
        let api = URL(string: "https://api.watchmode.com/v1/title/\(id)/details/?apiKey=YOUR_API_KEY&append_to_response=sources")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode(MovieDetail.self, from: data!)
                print(result)
            } catch {}
           
        }.resume()
    }
}
