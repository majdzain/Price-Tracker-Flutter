// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:price_tracker/core/constants/api_config.dart';
import 'package:price_tracker/core/helpers/web_socket_helper.dart';
import 'package:price_tracker/features/tracker/data/models/symbol_model.dart';

class SymbolsRemoteDataSource {
  WebSocketHelper channelHelper;
  SymbolsRemoteDataSource({
    required this.channelHelper,
  });

  Future<void> getActiveSymbols(
      Function(List<SymbolModel> symbols) retrieveSymbols) async {
    channelHelper.listen = (responseData) {
      Map<String, dynamic> data =
          jsonDecode(responseData as String) as Map<String, dynamic>;
      List activeSymbols = data['active_symbols'] as List;
      retrieveSymbols(
          activeSymbols.map((e) => SymbolModel.fromJson(e)).toList());
    };
    channelHelper.addData(APIConfig.getActiveSymbolsRequestJSON);
    return;
  }
}
