import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageNumberProvider = NotifierProvider<PageNum, int>(PageNum.new);

class PageNum extends Notifier<int> {
  @override
  int build() => 1;

  void next() => state = state + 1;
  void previous() => state = state < 1 ? state - 1 : state;
  void setPage(int pageNo) => state = pageNo;
}
