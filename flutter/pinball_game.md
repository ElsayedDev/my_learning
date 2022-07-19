# Pinball by flutter team

## Files dissevering

### main.dart

```dart
void main() {

  bootstrap(
    return App(
      <!-- 
        Repositories ,Helpers, any first initialization
       -->
    );
  );
}
```

#### *Bootstrap*

this file include all bootstraps before the application run

```dart

typedef BootstrapBuilder =  Future<Widget> Function(
    FirebaseFirestore firestore,
    FirebaseAuth firebaseAuth,
);


Future<void> bootstrap(BootstrapBuilder builder) async {
  // in sure the app run first
  WidgetsFlutterBinding.ensureInitialized();

  // to print the error
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // for bloc  
  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          await builder(
            FirebaseFirestore.instance,
            FirebaseAuth.instance,
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}



```

***runZonedGuarded***
this used above `MaterialApp` to manage synchronizations errors
so we here will called `(error, stackTrace) => log(error.toString(), stackTrace: stackTrace),`
