// import 'dart:async';

// import 'package:flutter/foundation.dart';

// abstract class StockTicker {
//   late final String title;
//   late final Timer stockTimer;

//   @protected
//   Stock? stock;

//   final _subscribers = <StockSubscriber>[];
//   void subscribe(StockSubscriber subscriber) => _subscribers.add(subscriber);

//   void unsubscribe(StockSubscriber subscriber) =>
//       _subscribers.removeWhere((s) => s.id == subscriber.id);

//   void notifySubscribers() {
//     for (final subscriber in _subscribers) {
//       subscriber.update(stock!);
//     }
//   }

//   void setStock(StockTickerSymbol stockTickerSymbol, int min, int max) {
//     final lastStock = stock;
//     final price = 80 / 100;
//     final changeAmount = lastStock != null ? price - lastStock.price : 0.0;

//     stock = Stock(
//       changeAmount: changeAmount.abs(),
//       changeDirection: changeAmount > 0
//           ? StockChangeDirection.growing
//           : StockChangeDirection.falling,
//       price: price,
//       symbol: stockTickerSymbol,
//     );
//   }

//   void stopTicker() {
//     stockTimer.cancel();
//   }
// }

// class Stock {
//   final StockTickerSymbol symbol;
//   final StockChangeDirection changeDirection;
//   final double price;
//   final double changeAmount;

//   const Stock({
//     required this.symbol,
//     required this.changeDirection,
//     required this.price,
//     required this.changeAmount,
//   });
// }

// enum StockTickerSymbol {
//   GME,
//   GOOGL,
//   TSLA,
// }

// extension StockTickerSymbolExtension on StockTickerSymbol {
//   String toShortString() => toString().split('.').last;
// }

// abstract class StockSubscriber {
//   late final String title;

//   final id = faker.guid.guid();

//   @protected
//   final StreamController<Stock> stockStreamController =
//       StreamController.broadcast();

//   Stream<Stock> get stockStream => stockStreamController.stream;

//   void update(Stock stock);
// }