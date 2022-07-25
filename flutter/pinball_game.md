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

----------

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

----------

#### *mixin*

mixin used to implement inheritance without class

```dart
mixin BallUtils {
  double ballVolume(double radius) {
    return 4 / 3 * 3.14 * pow(radius, 3);
  }

  void anyFunction(){
    // do something here
  }
}

/// A model class that defines some statistics of a football team.
abstract class FootballTeam with BallUtils {
  Strategy freeKickStrategy();
  int get offSidesCount;
}

class Team1 extends FootballTeam {}
class Team2 extends FootballTeam {}

// A Flutter widget that displays info of a volleyball pitch.
class VolleyballPitch extends StatelessWidget with BallUtils {
  const VolleyballPitch();

  @override
  Widget build(BuildContext context) {
    // code...
  }
}
```
