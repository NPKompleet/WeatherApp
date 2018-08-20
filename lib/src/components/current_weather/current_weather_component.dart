
import 'package:angular/angular.dart';
import 'package:weatherapp/src/models/current_weather.dart';

@Component(
  selector: 'current-weather',
  templateUrl: 'current_weather_component.html',
  styleUrls: ['current_weather_component.css'],
  directives: [coreDirectives]
)
class CurrentWeatherComponent implements OnInit{
  @Input()
  Weather currentWeather;
  @Input()
  int temp;
  
  String imgUrl, description;

  @override
  void ngOnInit() {
    imgUrl= "http://openweathermap.org/img/w/${currentWeather.icon}.png ";

    description= currentWeather.description;
  }

}