abstract class NotificationHub {
  List<TeamMember> getTeamMembers();
  void send(TeamMember sender, String message);
  void register(TeamMember member);
  void sendTo<T extends TeamMember>(TeamMember sender, String message);
}

abstract class TeamMember {
  final String name;
  String? lastNotification;
  NotificationHub? notificationHub;

  TeamMember(this.name);

  void receive(String from, String message) {
    lastNotification = '$from: $message';
  }

  void send(String message) {
    notificationHub?.send(this, message);
  }

  void sendTo<T extends TeamMember>(String message) {
    notificationHub?.sendTo<T>(this, message);
  }
}

class Admin extends TeamMember {
  Admin(String name) : super(name);

  void sendX() {
    notificationHub?.send(this, "Any things");
  }
}

class Developer extends Admin {
  Developer(String name) : super(name);
}

class Tester extends Admin {
  Tester(String name) : super(name);
}

class TeamNotificationHub extends NotificationHub {
  final List<TeamMember> _teamMembers = [];
  TeamNotificationHub({List<TeamMember>? members}) {
    members?.forEach((member) => register(member));
  }

  @override
  List<TeamMember> getTeamMembers() => _teamMembers;

  @override
  void register(TeamMember member) {
    member.notificationHub = this;
    _teamMembers.add(member);
  }

  @override
  void send(TeamMember sender, String message) {
    final filteredMembers = _teamMembers.where((m) => m != sender);

    for (final member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }

  @override
  void sendTo<T extends TeamMember>(TeamMember sender, String message) {
    final filteredMembers =
        _teamMembers.where((m) => m != sender).whereType<T>();

    for (final member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }
}

void main(List<String> args) {
  final notificationHub = TeamNotificationHub(
    members: [
      Admin('Admin'),
      Developer('Developer'),
      Tester('Tester'),
    ],
  );

  final admin = notificationHub.getTeamMembers().firstWhereType<Admin>();
  final developer =
      notificationHub.getTeamMembers().firstWhereType<Developer>();
  final tester = notificationHub.getTeamMembers().firstWhereType<Tester>();

  admin.send('Hello');
  developer.send('Hello');
  tester.send('Hello');

  admin.sendTo<Developer>('Hello');
  developer.sendTo<Tester>('Hello');
  tester.sendTo<Admin>('Hello');

  print(admin.lastNotification);
  print(developer.lastNotification);
  print(tester.lastNotification);
}
