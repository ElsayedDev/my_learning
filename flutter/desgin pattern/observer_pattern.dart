import 'dart:async';
import 'dart:math';

abstract class StockTicker {
  late final String title;
  late final Timer stockTimer;
  Stock? _stock;
  final _subscribers = <StockSubscriber>[];

  void subscribe(StockSubscriber subscriber) => _subscribers.add(subscriber);
  void unsubscribe(StockSubscriber subscriber) =>
      _subscribers.removeWhere((s) => s.id == subscriber.id);
  void notifySubscribers() {
    for (final subscriber in _subscribers) {
      subscriber.update(_stock!);
    }
  }

  void setStock(StockTickerSymbol stockTickerSymbol, int min, int max) {
    final lastStock = _stock;
    final price = (Random().nextInt(max - min) + min) / 100;
    final changeAmount = lastStock != null ? price - lastStock.price : 0.0;

    _stock = Stock(
      changeAmount: changeAmount.abs(),
      changeDirection: changeAmount > 0
          ? StockChangeDirection.growing
          : StockChangeDirection.falling,
      price: price,
      symbol: stockTickerSymbol,
    );
  }

  void stopTicker() {
    stockTimer.cancel();
  }
}

class GameStopStockTicker extends StockTicker {
  GameStopStockTicker() {
    title = StockTickerSymbol.GME.toShortString();
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        setStock(StockTickerSymbol.GME, 16000, 22000);
        notifySubscribers();
      },
    );
  }
}

class GoogleStockTicker extends StockTicker {
  GoogleStockTicker() {
    title = StockTickerSymbol.GOOGL.toShortString();
    stockTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        setStock(StockTickerSymbol.GOOGL, 200000, 204000);
        notifySubscribers();
      },
    );
  }
}

class TeslaStockTicker extends StockTicker {
  TeslaStockTicker() {
    title = StockTickerSymbol.TSLA.toShortString();
    stockTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        setStock(StockTickerSymbol.TSLA, 60000, 65000);
        notifySubscribers();
      },
    );
  }
}

class Stock {
  final StockTickerSymbol symbol;
  final StockChangeDirection changeDirection;
  final double price;
  final double changeAmount;

  const Stock({
    required this.symbol,
    required this.changeDirection,
    required this.price,
    required this.changeAmount,
  });
}

enum StockTickerSymbol {
  GME,
  GOOGL,
  TSLA,
}

extension StockTickerSymbolExtension on StockTickerSymbol {
  String toShortString() => toString().split('.').last;
}

enum StockChangeDirection {
  falling,
  growing,
}

abstract class StockSubscriber {
  late final String title;

  final id = Random().nextInt(50);

  final StreamController<Stock> stockStreamController =
      StreamController.broadcast();

  Stream<Stock> get stockStream => stockStreamController.stream;

  // final StreamController<Stock> _stockStreamController =
  //     StreamController.broadcast();

  // Stream<Stock> get stockStream => _stockStreamController.stream;

  void update(Stock stock);
}

class DefaultStockSubscriber extends StockSubscriber {
  DefaultStockSubscriber() {
    title = 'All stocks';
  }

  @override
  void update(Stock stock) {
    print('DefaultStockSubscriber: $stock');
    stockStreamController.add(stock);
  }
}

class GrowingStockSubscriber extends StockSubscriber {
  GrowingStockSubscriber() {
    title = 'Growing stocks';
  }

  @override
  void update(Stock stock) {
    if (stock.changeDirection == StockChangeDirection.growing) {
      print('GrowingStockSubscriber: $stock');
      stockStreamController.add(stock);
    }
  }
}

main() async {
  // final _stockSubscriberList = <StockSubscriber>[
  //   DefaultStockSubscriber(),
  //   GrowingStockSubscriber(),
  // ];

  // final _stockEntries = <Stock>[];

  StockSubscriber _subscriber = DefaultStockSubscriber();
  // int _selectedSubscriberIndex = 0;

  await _subscriber.stockStream.listen((stock) {
    print("readd");
  });
  // void _onStockChange(Stock stock) {
  //   _stockEntries.add(stock);
  // }

  // void _setSelectedSubscriberIndex(int? index) {
  //   _stockStreamSubscription?.cancel();

  //   _stockEntries.clear();
  //   _selectedSubscriberIndex = index!;
  //   _subscriber = _stockSubscriberList[_selectedSubscriberIndex];
  //   _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
  // }
}
