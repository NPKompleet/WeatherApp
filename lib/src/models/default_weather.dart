import 'package:weatherapp/src/models/forecast_weather.dart';

Map jsonString= {"dt":1534496400,"main":{"temp":298.93,"temp_min":298.93,"temp_max":299.938,"pressure":972.47,"sea_level":1026.03,"grnd_level":972.47,"humidity":91,"temp_kf":-1.01},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"clouds":{"all":36},"wind":{"speed":5.82,"deg":248.002},"rain":{},"sys":{"pod":"d"},"dt_txt":"2018-08-17 09:00:00"};
WeatherInfo defaultWeatherInfo = WeatherInfo.fromJson(jsonString);