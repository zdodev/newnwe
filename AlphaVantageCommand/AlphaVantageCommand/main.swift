import Foundation
import Combine

typealias Ticker = String
private var cancellables = Set<AnyCancellable>()
let url = "https://www.alphavantage.co"
let a = AlphaVantageWebService(session: URLSession.shared, baseURL: url)
a.loadDividends("AAPL")
    .sink { result in
        switch result {
        case .failure(let error):
            print(error)
        case .finished:
            print("finished")
        }
    } receiveValue: { value in
        print(value)
    }
    .store(in: &cancellables)


//
//print("ticker: ", terminator: "")
//let ticker = readLine()!
//let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=\(ticker)&apikey=WIN4ZCY6VUPIHEB9")!
//
//let p = URLSession.shared
//    .dataTaskPublisher(for: url)
//    .sink { error in
//    switch error {
//    case .finished:
//        print("finished")
//    case .failure(let error):
//        print(error)
//    }
//} receiveValue: { data in
//    if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String: Any] {
//        if let a = json["Monthly Adjusted Time Series"] as? [String: Any] {
//            a.keys.sorted().forEach { date in
//                if let b = a[date] as? [String: String] {
//                    print(date, b["7. dividend amount"]!)
//                }
//            }
//        }
//    }
//}


RunLoop.main.run()
