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
      // _recipientCtrl.add(event);
    }, onError: (e) async {
      // _recipientCtrl.addError(e);
      // await Future.delayed(const Duration(seconds: 2));
      print('error');
      // connect();
    }, onDone: () async {
      await Future.delayed(const Duration(seconds: 2));
      print('done');
      // connect();
    });
    // streamController = StreamController.broadcast(onCancel: () {});
    // stream = channel.stream.asBroadcastStream(onCancel: (s) {
    //   channel = WebSocketChannel.connect(
    //     Uri.parse(APIConfig.channelServerUrl),
    //   );
    // }, onListen: (s) {
    //   print(s);
    // });
    isConnected = true;
  }

  void disconnect() {
    // _sentCtrl.close();
    channel.sink.close();
  }

  void addData(String requestData) {
    // if (!isConnected) {
    //   connect();
    // }
    // connect();
    print(requestData);
    channel.sink.add(requestData);
  }

  // Stream getStream() {
  //   // if (!isConnected) {
  //   //   connect();
  //   // }
  //   // channel.stream.listen((event) {
  //   //   print(event);
  //   //   streamController.add(event);
  //   // });
  //   // if (stream == null) {

  //   // }
  //   return _recipientCtrl.stream;
  // }

  // void cancelStream() {
  //   channel.sink.close();
  // }
}
