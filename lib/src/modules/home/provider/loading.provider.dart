import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingProvider =
    NotifierProvider<LoadingProvider, bool>(LoadingProvider.new);

class LoadingProvider extends Notifier<bool> {
  @override
  bool build() => false;
  set isLoading(bool b) => state = b;
}
