//
//  SchoolViewModel.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/24/22.
//

import Foundation

@MainActor // To update data on main thread
class SchoolViewModel: ObservableObject {
    @Published var nycHighSchoolsList: [SchoolDataModel] = []
    @Published var nycHighSchoolsSatScore: [SchoolSatScoreDataModel] = []
    @Published var searchText: String = ""
    
    enum NetworkingError: LocalizedError {
        case badURlResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURlResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    func fetchNycHighSchoolsList() async throws {
        do {
            let data = try await fetchData(urlString: Constants.highSchoolsURL)
            do {
                self.nycHighSchoolsList = try JSONDecoder().decode([SchoolDataModel].self, from: data)
                self.nycHighSchoolsList.sort(by: {$0.schoolName < $1.schoolName})
            } catch {
                debugPrint("Error in decoding JSON: \(String(describing: error))")
            }
        } catch {
            debugPrint("Error in fetching Data: \(String(describing: error))")
        }
    }
    
    func fetchData(urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            fatalError(Constants.notAbleToGetURLFromString)
        }
        let (data, response) = try! await URLSession.shared.data(from: url, delegate: nil)
        guard
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURlResponse(url: url)
        }
        return data
    }
    
    func fetchSatData() async throws {
        do {
            let data = try await fetchData(urlString: Constants.schoolWithSATScoreURL)
            do {
                let satScore = try JSONDecoder().decode([SchoolSatScoreDataModel].self, from: data)
                self.nycHighSchoolsSatScore = satScore
            } catch let error {
                debugPrint("Error in decoding JSON: \(String(describing: error))")
            }
        } catch {
            debugPrint("Error in fetching Data: \(String(describing: error))")
        }
    }
}
