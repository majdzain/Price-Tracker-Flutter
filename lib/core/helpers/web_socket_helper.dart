import 'dart:async';

import 'package:price_tracker/core/constants/api_config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketHelper {
  bool isConnected = false;
  late WebSocketChannel channel;
  Function(String?)? listen;

  WebSocketHelper() {
    connect();
  }

  void connect() {
    print('connect');
    listen = null;
    channel = WebSocketChannel.connect(
      Uri.parse(APIConfig.channelServerUrl),
    );
    channel.stream.listen((event) {
      print('listen');
      if (listen != null) {
        listen!(event);
      }
    }, onError: (e) async {
      print('error');
    }, onDone: () async {
      await Future.delayed(const Duration(seconds: 2));
      print('done');
    });
    isConnected = true;
  }

  void disconnect() {
    channel.sink.close();
  }

  void addData(String requestData) {
    print(requestData);
    channel.sink.add(requestData);
  }
}
