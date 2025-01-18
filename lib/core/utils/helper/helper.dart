import 'package:logger/logger.dart';

final Logger logger = Logger();

void errorlog(String log){
  Logger().e(log);
}

void infolog(String log){
  Logger().i(log);
}