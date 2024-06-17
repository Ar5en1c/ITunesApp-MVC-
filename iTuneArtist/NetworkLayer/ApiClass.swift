import Foundation

//MARK: Main API class
class ApiClass {
    static let shared = ApiClass()

    //MARK: Fetch Data function with Generic Type
    func fetchData<T: Decodable>(url: String, completion: @escaping (T?) -> ()) {
        guard let serverURL = URL(string: url) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
            if let error = error {
                print("Encountered error while fetching data from server: \(error)")
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            } catch {
                print("Unable to convert serialized object to model: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    //MARK: Fetch Image function with Data? Type for converting the data to UIImage
    func fetchImage(from url: String, completion: @escaping (Data?) -> Void) {
        guard let imageURL = URL(string: url) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let error = error {
                print("Error fetching image: \(error)")
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}
