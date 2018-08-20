
import 'package:angular/angular.dart';

@Component(
  selector: 'my-switch',
  styleUrls: ['switch_component.css'],
  templateUrl: 'switch_component.html',
  directives: [coreDirectives]
)
class SwitchComponent{
  bool knobFloatRight = false;
  void toggleTempUnit(){
    knobFloatRight = !knobFloatRight;
  }
}