//
//  ViewController.swift
//  TermProject
//
//  Created by smilepotato on 16/06/2024.
//

import UIKit

class CityViewController: UIViewController {

    @IBOutlet weak var cityPickerView: UIPickerView!
    
    @IBOutlet weak var textField: UITextField!
    
    var cities : [String: [String:Double]] = [
        "Bangkok" : ["lon": 100.5167, "lat":13.75],
        "Beijing" : ["lon": 116.4074, "lat":39.9042],
        "Berlin" : ["lon": 13.4105, "lat":52.5244],
        "Buenos Aires" : ["lon": -58.3816, "lat":-34.6037],
        "Chicago" : ["lon": -87.6298, "lat":41.8781],
        "Dubai" : ["lon": 55.2708, "lat":25.2048],
        "Hong Kong" : ["lon": 114.1694, "lat":22.3193],
        "Istanbul" : ["lon": 28.9784, "lat":41.0082],
        "Jakarta" : ["lon": 106.8456, "lat":-6.2088],
        "Jerusalem" : ["lon": 35.2163, "lat":31.769],
        "Kuala Lumpur" : ["lon": 101.6869, "lat":3.139],
        "Lisbon" : ["lon": -9.1333, "lat":38.7167],
        "London" : ["lon": -0.1257, "lat":51.5085],
        "Los Angeles" : ["lon": -118.2437, "lat":34.0522],
        "Madrid" : ["lon": -3.7038, "lat":40.4168],
        "Mexico City" : ["lon": -99.1332, "lat":19.4326],
        "Moscow" : ["lon": 37.6173, "lat":55.7558],
        "New Delhi" : ["lon": 77.209, "lat":28.6139],
        "New York" : ["lon": -74.006, "lat":40.7143],
        "Paris" : ["lon": 2.3488, "lat":48.8534],
        "Rio de Janeiro" : ["lon": -43.2075, "lat":-22.9028],
        "Rome" : ["lon": 12.4964, "lat":41.9028],
        "Santiago" : ["lon": -70.6483, "lat":-33.4569],
        "Sao Paulo" : ["lon": -46.6333, "lat":-23.5505],
        "Seoul" : ["lon": 126.9778, "lat":37.5683],
        "Shanghai" : ["lon": 121.4737, "lat":31.2304],
        "Singapore" : ["lon": 103.8198, "lat":1.3521],
        "Sydney" : ["lon": 151.2073, "lat":-33.8679],
        "Tokyo" : ["lon": 139.6917, "lat":35.6895],
        "Toronto" : ["lon": -79.3832, "lat":43.6532],
        "Vancouver" : ["lon": -123.1207, "lat":49.2827],
        "Vienna" : ["lon": 16.3738, "lat":48.2082],
        "Zurich" : ["lon": 8.5417, "lat":47.3769]
    ]
    
    var cityDescriptions: [String: String] = [
        "Bangkok": "방콕은 태국의 수도로, \n길거리 음식과 저렴한 쇼핑으로 유명합니다.",
        "Beijing": "베이징은 중국의 수도로,\n 긴 역사와 문화를 자랑하는 도시입니다.",
        "Berlin": "베를린은 독일의 수도로,\n 예술과 역사적 건축물로 유명합니다.",
        "Buenos Aires": "부에노스아이레스는 아르헨티나의 수도로,\n 탱고와 스테이크가 유명한 도시입니다.",
        "Chicago": "시카고는 미국의 대도시로,\n 높은 건물과 미국 스타일의 대도시 생활을\n경험할 수 있습니다.",
        "Dubai": "두바이는 아랍에미리트의 도시로,\n 현대적인 건축물과 럭셔리 쇼핑 명소로 유명합니다.",
        "Hong Kong": "홍콩은 중국의 특별행정구로,\n 혼잡한 도시와 풍부한 문화가 공존하는 도시입니다.",
        "Istanbul": "이스탄불은 터키의 큰 도시로,\n 동양과 서양 문화가 만나는 곳입니다.",
        "Jakarta": "자카르타는 인도네시아의 수도로,\n 다양한 문화적 경험과 역사적인 유산을 지니고 있습니다.",
        "Jerusalem": "예루살렘은 이스라엘의 수도로, \n세계 세습 종교들의 중요한 성지입니다.",
        "Kuala Lumpur": "쿠알라룸푸르는 말레이시아의 수도로,\n 현대적인 건축과 풍부한 문화를 즐길 수 있습니다.",
        "Lisbon": "리스본은 포르투갈의 수도로,\n 아름다운 해안과 역사적인 건축물이 특징입니다.",
        "London": "런던은 영국의 수도로,\n 다양한 박물관과 역사적인 건축물이 많은 도시입니다.",
        "Los Angeles": "로스앤젤레스는 미국의 대도시로,\n 세계적인 엔터테인먼트 산업의 중심지입니다.",
        "Madrid": "마드리드는 스페인의 수도로,\n 예술과 문화가 풍부한 도시입니다.",
        "Mexico City": "멕시코시티는 멕시코의 수도로, \n역사적인 유산과 다양한 미술관이 있는 도시입니다.",
        "Moscow": "모스크바는 러시아의 수도로, \n장엄한 교회와 역사적인 건축물이 많이 있는 도시입니다.",
        "New Delhi": "뉴델리는 인도의 수도로,\n 다양한 종교적 유산과 문화적 경험을 제공합니다.",
        "New York": "뉴욕은 미국의 대도시로,\n 세계적인 금융 중심지와 다양한 문화 경험을 제공합니다.",
        "Paris": "파리는 프랑스의 수도로,\n 로맨틱한 분위기와 미술의 중심지로 유명합니다.",
        "Rio de Janeiro": "리우데자네이루는 브라질의 도시로,\n 사르니아 국제적인 축제와 아름다운 해변이 특징입니다.",
        "Rome": "로마는 이탈리아의 수도로, \n고대 로마의 유적과 예술적인 건축물로 유명합니다.",
        "Santiago": "산티아고는 칠레의 수도로, \n안데스 산맥과 가까운 아름다운 도시입니다.",
        "Sao Paulo": "상파울루는 브라질의 도시로,\n 경제적 중심지와 문화적 다양성이 풍부합니다.",
        "Seoul": "서울은 한국의 수도로, \n현대적인 건축물과 전통적인 문화를 동시에\n 체험할 수 있는 도시입니다.",
        "Shanghai": "상해는 중국의 대도시로,\n 현대적인 건축과 급속히 변화하는 도시입니다.",
        "Singapore": "싱가포르는 동남아시아의 섬나라로,\n 현대적인 도시와 다양한 문화가 공존하는 도시입니다.",
        "Sydney": "시드니는 호주의 대도시로, \n아이코닉한 오페라하우스와 활기찬 해안가가 특징입니다.",
        "Tokyo": "도쿄는 일본의 수도로,\n 현대적인 건축과 전통적인 문화를 \n한 자리에서 경험할 수 있는 도시입니다.",
        "Toronto": "토론토는 캐나다의 대도시로,\n 다문화적인 사회와 현대적인 건축물이\n 공존하는 도시입니다.",
        "Vancouver": "밴쿠버는 캐나다의 도시로, \n자연과 도시가 조화를 이룬 아름다운 도시입니다.",
        "Vienna": "비엔나는 오스트리아의 수도로,\n 고전 음악의 중심지와 아름다운 건축물이 특징입니다.",
        "Zurich": "취리히는 스위스의 도시로,\n 금융 중심지와 아름다운 호수가 있는 도시입니다."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        cityPickerView.dataSource = self
        cityPickerView.delegate = self
    }
}

extension CityViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.keys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cityNames = Array(cities.keys).sorted()
        return cityNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateTextFieldForSelectedCity()
    }
    
    private func updateTextFieldForSelectedCity() {
        let cityNames = Array(cities.keys).sorted()
        let selectedCity = cityNames[cityPickerView.selectedRow(inComponent: 0)]
        textField.text = selectedCity
    }
}

extension CityViewController {
    func getCurrentLonLatAndText() -> (String, Double?, Double?, String?, String?) {
        let cityNames = Array(cities.keys).sorted()
        let selectedCity = cityNames[cityPickerView.selectedRow(inComponent: 0)]
        let city = cities[selectedCity]
        let cityName = selectedCity
        let text = textField.text
        let description = cityDescriptions[selectedCity]
        return (cityName, city?["lon"], city?["lat"], text, description)
    }
}
