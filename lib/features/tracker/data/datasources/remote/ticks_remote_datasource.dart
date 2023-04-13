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
