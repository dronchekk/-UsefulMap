//
//  NetworkService.swift
//  UsefullMap
//
//  Created by Andrey Rachitskiy on 24.11.2022.
//

import Foundation

class NetworkManager {

    private let scheme = "https"
    private let host = "zasenko.000webhostapp.com"

    // MARK: - Получение списка стран
    func getAllCountries() async throws -> CountriesList {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/get_all_countries.php"
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedCountriesList = try? JSONDecoder().decode(CountriesList.self, from: data) else { throw FetchError.decoderError }
        return decodedCountriesList
    }

    // MARK: - Получение списка городов по id страны
    func getAllCitiesByCountryId(country_id: String) async throws -> CitiesList {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/get_all_cities_by_country_id.php"
            components.queryItems = [
                URLQueryItem(name: "country_id", value: country_id)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedCitiesList = try? JSONDecoder().decode(CitiesList.self, from: data) else { throw FetchError.decoderError }
        return decodedCitiesList
}

    // MARK: - Получение списка всех локаций по id города
    func getAllPlacesByCityId(city_id: String) async throws -> PlacesList {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/get_all_places_by_city_id.php"
            components.queryItems = [
                URLQueryItem(name: "city_id", value: city_id)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedPlacesList = try? JSONDecoder().decode(PlacesList.self, from: data) else { throw FetchError.decoderError }
        return decodedPlacesList
    }

    // MARK: - Получение списка мест по локации юзера
    func getPlacesByLocation(user_latitude: String, user_longitude: String, radius: String) async throws -> PlacesRadList {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/get_places_by_location.php"
            components.queryItems = [
                URLQueryItem(name: "user_latitude", value: user_latitude),
                URLQueryItem(name: "user_longitude", value: user_longitude),
                URLQueryItem(name: "radius", value: radius)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedPlacesRadList = try? JSONDecoder().decode(PlacesRadList.self, from: data) else { throw FetchError.decoderError }
        return decodedPlacesRadList
    }

    // MARK: - Получение всей информации о локации:
    func getPlaceInfoById(place_id: String) async throws -> LocationInfo {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/get_place_info_by_id.php"
            components.queryItems = [
                URLQueryItem(name: "place_id", value: place_id)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedLocationInfo = try? JSONDecoder().decode(LocationInfo.self, from: data) else { throw FetchError.decoderError }
        return decodedLocationInfo
    }

    // MARK: - Регистрация юзера
    func registration(user_login: String, user_password: String, user_name: String) async throws -> RegistrationResult {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/registration.php"
            components.queryItems = [
                URLQueryItem(name: "user_login", value: user_login),
                URLQueryItem(name: "user_password", value: user_password),
                URLQueryItem(name: "user_password", value: user_password)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedRegistrationResult = try? JSONDecoder().decode(RegistrationResult.self, from: data) else { throw FetchError.decoderError }
        return decodedRegistrationResult
    }
    // MARK: - Вход Юзера в приложение
    func login(user_login: String, user_password: String) async throws -> LoginResult {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/login.php"
            components.queryItems = [
                URLQueryItem(name: "user_login", value: user_login),
                URLQueryItem(name: "user_password", value: user_password)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedLoginResult = try? JSONDecoder().decode(LoginResult.self, from: data) else { throw FetchError.decoderError }
        return decodedLoginResult
    }
    // MARK: - Добавление отзыва
    func addComment(place_id: String, text: String, user_id: String) async throws -> AddCommentResult {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/add_comment.php"
            components.queryItems = [
                URLQueryItem(name: "place_id", value: place_id),
                URLQueryItem(name: "text", value: text),
                URLQueryItem(name: "user_id", value: user_id)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedAddCommentResult = try? JSONDecoder().decode(AddCommentResult.self, from: data) else { throw FetchError.decoderError }
        return decodedAddCommentResult
    }
    // MARK: - Поставить/удалить like к комментарию
    func commentLike(comment_id: String, user_id: String) async throws -> LikeCommentResult {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/comment_like.php"
            components.queryItems = [
                URLQueryItem(name: "comment_id", value: comment_id),
                URLQueryItem(name: "user_id", value: user_id)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedLikeCommentResult = try? JSONDecoder().decode(LikeCommentResult.self, from: data) else { throw FetchError.decoderError }
        return decodedLikeCommentResult
    }
    // MARK: - Поставить/удалить like к локации
    func locationLike(place_id: String, user_id: String) async throws -> LikeLocationResult {
        var urlComponents: URLComponents {
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = "/comment_like.php"
            components.queryItems = [
                URLQueryItem(name: "place_id", value: place_id),
                URLQueryItem(name: "user_id", value: user_id)
            ]
            return components
        }
        guard let url = urlComponents.url else { throw FetchError.bedUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw FetchError.invalidStatusCode }
        guard let decodedLikeLocationResult = try? JSONDecoder().decode(LikeLocationResult.self, from: data) else { throw FetchError.decoderError }
        return decodedLikeLocationResult
    }
}
