// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let aPI = try API(json)

import Foundation

// MARK: - API
struct API: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let minutely: [Minutely]
    let hourly: [Hourly]
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily
    }
}

// MARK: API convenience initializers and mutators

extension API {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(API.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        lat: Double? = nil,
        lon: Double? = nil,
        timezone: String? = nil,
        timezoneOffset: Int? = nil,
        current: Current? = nil,
        minutely: [Minutely]? = nil,
        hourly: [Hourly]? = nil,
        daily: [Daily]? = nil
    ) -> API {
        return API(
            lat: lat ?? self.lat,
            lon: lon ?? self.lon,
            timezone: timezone ?? self.timezone,
            timezoneOffset: timezoneOffset ?? self.timezoneOffset,
            current: current ?? self.current,
            minutely: minutely ?? self.minutely,
            hourly: hourly ?? self.hourly,
            daily: daily ?? self.daily
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Current
struct Current: Codable {
    let dt, sunrise, sunset: Int
    let temp, feelsLike: Double
    let pressure, humidity, dewPoint: Double
    let uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double?
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather
    }
}

// MARK: Current convenience initializers and mutators

extension Current {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Current.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        dt: Int? = nil,
        sunrise: Int? = nil,
        sunset: Int? = nil,
        temp: Double? = nil,
        feelsLike: Double? = nil,
        pressure: Double? = nil,
        humidity: Double? = nil,
        dewPoint: Double? = nil,
        uvi: Double? = nil,
        clouds: Int? = nil,
        visibility: Int? = nil,
        windSpeed: Double? = nil,
        windDeg: Int? = nil,
        windGust: Double? = nil,
        weather: [Weather]? = nil
    ) -> Current {
        return Current(
            dt: dt ?? self.dt,
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset,
            temp: temp ?? self.temp,
            feelsLike: feelsLike ?? self.feelsLike,
            pressure: pressure ?? self.pressure,
            humidity: humidity ?? self.humidity,
            dewPoint: dewPoint ?? self.dewPoint,
            uvi: uvi ?? self.uvi,
            clouds: clouds ?? self.clouds,
            visibility: visibility ?? self.visibility,
            windSpeed: windSpeed ?? self.windSpeed,
            windDeg: windDeg ?? self.windDeg,
            windGust: windGust ?? self.windGust,
            weather: weather ?? self.weather
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: Weather convenience initializers and mutators

extension Weather {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Weather.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        main: String? = nil,
        weatherDescription: String? = nil,
        icon: String? = nil
    ) -> Weather {
        return Weather(
            id: id ?? self.id,
            main: main ?? self.main,
            weatherDescription: weatherDescription ?? self.weatherDescription,
            icon: icon ?? self.icon
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let uvi: Double

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, pop, rain, uvi
    }
}

// MARK: Daily convenience initializers and mutators

extension Daily {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Daily.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        dt: Int? = nil,
        sunrise: Int? = nil,
        sunset: Int? = nil,
        temp: Temp? = nil,
        feelsLike: FeelsLike? = nil,
        pressure: Int? = nil,
        humidity: Int? = nil,
        dewPoint: Double? = nil,
        windSpeed: Double? = nil,
        windDeg: Int? = nil,
        weather: [Weather]? = nil,
        clouds: Int? = nil,
        pop: Double? = nil,
        rain: Double?? = nil,
        uvi: Double? = nil
    ) -> Daily {
        return Daily(
            dt: dt ?? self.dt,
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset,
            temp: temp ?? self.temp,
            feelsLike: feelsLike ?? self.feelsLike,
            pressure: pressure ?? self.pressure,
            humidity: humidity ?? self.humidity,
            dewPoint: dewPoint ?? self.dewPoint,
            windSpeed: windSpeed ?? self.windSpeed,
            windDeg: windDeg ?? self.windDeg,
            weather: weather ?? self.weather,
            clouds: clouds ?? self.clouds,
            pop: pop ?? self.pop,
            rain: rain ?? self.rain,
            uvi: uvi ?? self.uvi
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

// MARK: FeelsLike convenience initializers and mutators

extension FeelsLike {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FeelsLike.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        day: Double? = nil,
        night: Double? = nil,
        eve: Double? = nil,
        morn: Double? = nil
    ) -> FeelsLike {
        return FeelsLike(
            day: day ?? self.day,
            night: night ?? self.night,
            eve: eve ?? self.eve,
            morn: morn ?? self.morn
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: Temp convenience initializers and mutators

extension Temp {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Temp.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        day: Double? = nil,
        min: Double? = nil,
        max: Double? = nil,
        night: Double? = nil,
        eve: Double? = nil,
        morn: Double? = nil
    ) -> Temp {
        return Temp(
            day: day ?? self.day,
            min: min ?? self.min,
            max: max ?? self.max,
            night: night ?? self.night,
            eve: eve ?? self.eve,
            morn: morn ?? self.morn
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let pop: Double
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, pop, rain
    }
}

// MARK: Hourly convenience initializers and mutators

extension Hourly {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Hourly.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        dt: Int? = nil,
        temp: Double? = nil,
        feelsLike: Double? = nil,
        pressure: Int? = nil,
        humidity: Int? = nil,
        dewPoint: Double? = nil,
        clouds: Int? = nil,
        visibility: Int? = nil,
        windSpeed: Double? = nil,
        windDeg: Int? = nil,
        weather: [Weather]? = nil,
        pop: Double? = nil,
        rain: Rain?? = nil
    ) -> Hourly {
        return Hourly(
            dt: dt ?? self.dt,
            temp: temp ?? self.temp,
            feelsLike: feelsLike ?? self.feelsLike,
            pressure: pressure ?? self.pressure,
            humidity: humidity ?? self.humidity,
            dewPoint: dewPoint ?? self.dewPoint,
            clouds: clouds ?? self.clouds,
            visibility: visibility ?? self.visibility,
            windSpeed: windSpeed ?? self.windSpeed,
            windDeg: windDeg ?? self.windDeg,
            weather: weather ?? self.weather,
            pop: pop ?? self.pop,
            rain: rain ?? self.rain
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: Rain convenience initializers and mutators

extension Rain {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Rain.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        the1H: Double? = nil
    ) -> Rain {
        return Rain(
            the1H: the1H ?? self.the1H
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Minutely
struct Minutely: Codable {
    let dt: Int
    let precipitation: Double
}

// MARK: Minutely convenience initializers and mutators

extension Minutely {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Minutely.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        dt: Int? = nil,
        precipitation: Double? = nil
    ) -> Minutely {
        return Minutely(
            dt: dt ?? self.dt,
            precipitation: precipitation ?? self.precipitation
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
