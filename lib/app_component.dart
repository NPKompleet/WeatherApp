
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:weatherapp/src/components/current_weather/current_weather_component.dart';
import 'package:weatherapp/src/components/daily_weather/daily_weather_component.dart';
import 'package:weatherapp/src/components/popup_menu/popup_menu_component.dart';
import 'package:weatherapp/src/components/switch/switch_component.dart';
import 'package:weatherapp/src/models/current_weather.dart';
import 'package:weatherapp/src/models/forecast_weather.dart';
import 'package:weatherapp/src/services/weather_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css',],
  templateUrl: 'app_component.html',
  directives: [coreDirectives, MaterialIconComponent, SwitchComponent,
              CurrentWeatherComponent, DailyWeatherComponent, PopUpComponent, NgFor, NgIf],
  providers: [materialProviders, 
              ClassProvider(WeatherForecastService),
              ClassProvider(CurrentWeatherService)],
  pipes:[DatePipe]
)
class AppComponent implements OnInit{

  WeatherForecastService _weatherService;
  CurrentWeatherService _currentWeatherService;
  List<WeatherInfo> weatherInfoList;
  CurrentWeatherApiData currentWeatherData;

  AppComponent(this._weatherService, this._currentWeatherService);

  String menuIconColor = 'white';
  bool hideMenu= true;
  DateTime date= DateTime.now();
  String city;
  
  void menuClicked(){
    hideMenu= !hideMenu;
  }


  @override
  void ngOnInit() => callWeatherServices();

  void callWeatherServices(){
    getCurrentWeather();
    getWeatherForecast();
  }

  void getWeatherForecast() async{
    print("Getting weather FORECAST.....");
    ForecastApiData data= await _weatherService.getWeatherForecast();
    weatherInfoList= data.list;
    // city= "${data.city.name}, ${data.city.country}";
  }

  void getCurrentWeather() async{
    print("Getting CURRENT weather.....");
    currentWeatherData= await _currentWeatherService.getCurrentWeather();
    city= "${currentWeatherData.name}, ${currentWeatherData.sys.country}";
  }

}