import 'dart:convert';

import 'package:price_tracker/core/helpers/web_socket_helper.dart';
import 'package:price_tracker/features/tracker/data/models/tick_model.dart';

class TicksRemoteDataSource {
  WebSocketHelper channelHelper;
  TicksRemoteDataSource({
    required this.channelHelper,
  });

  Future<void> getTickByTick(
      String symbol, Function(TickModel tickModel) retrieveTick) async {
    final String requestData = '{"ticks": "$symbol","subscribe": 1}';
    retrieveTick(TickModel.fromJson(jsonDecode(
            '{"ask": 215.4403,"bid": 215.4203,"epoch": 1675856816,"id": "417a56af-c9f1-cd25-654d-3c77e9025d18","pip_size": 4,"quote": 215.4303,"symbol": "R_50"}')
        as Map<String, dynamic>));
    channelHelper.listen = (responseData) {
      Map<String, dynamic> data =
          jsonDecode(responseData as String) as Map<String, dynamic>;
      if (data['tick'] != null) {
        Map<String, dynamic> tick = data['tick'] as Map<String, dynamic>;
        retrieveTick(TickModel.fromJson(tick));
      }
    };
    channelHelper.addData(requestData);
  }

  void forgetPrevious(String subscription) {
    final String requestData = '{"forget": "$subscription"}';
    channelHelper.addData(requestData);
  }
}
