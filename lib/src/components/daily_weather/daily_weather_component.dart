import 'package:angular/angular.dart';
import 'package:weatherapp/src/models/forecast_weather.dart' show WeatherInfo;

@Component(
  selector: 'daily-weather',
  templateUrl: 'daily_weather_component.html',
  styleUrls: ['daily_weather_component.css'],
  directives: [coreDirectives],
  pipes: [DatePipe, UpperCasePipe],
)
class DailyWeatherComponent implements OnInit{
  DateTime date;
  int temp=65;
  int minTemp= 51;
  String description= "Partly sunny";
  String imgUrl= "img/cloudy.png";

  @Input()
  WeatherInfo weatherInfo;

  @override
  void ngOnInit() {
    date= DateTime.parse(weatherInfo.dtTxt);
    temp= weatherInfo.main.temp.floor() ?? 67;
    minTemp= weatherInfo.main.tempMin.floor() ?? 51;
    description= weatherInfo.weather[0].description ?? "Partly sunny";
    imgUrl= "http://openweathermap.org/img/w/${weatherInfo.weather[0].icon}.png ";
  }
}