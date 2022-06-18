// main.dart

import 'package:args/command_runner.dart';

void main(List<String> args) {
  var runner = CommandRunner(
      "dgit", "A dart implementation of distributed version control.")
    ..addCommand(CommitCommand())
    ..addCommand(StashCommand())
    ..run(args);
}

class CommitCommand extends Command {
  // The [name] and [description] properties must be defined by every
  // subclass.
  @override
  final name = "commit";
  @override
  final description = "Record changes to the repository.";

  CommitCommand() {
    // we can add command specific arguments here.
    // [argParser] is automatically created by the parent class.
    argParser.addFlag('all', abbr: 'a');
  }

  // [run] may also return a Future.
  @override
  void run() {
    // [argResults] is set before [run()] is called and contains the flags/options
    // passed to this command.
    print("运行");
    print(argResults!['all']);
  }
}

class StashCommand extends Command {
  final String name = "stash";
  final String description = "Stash changes in the working directory.";

  StashCommand() {
    addSubcommand(StashSaveCommand());
  }
}

class StashSaveCommand extends Command {
  @override
  // TODO: implement description
  String get description => "hhhhh";

  @override
  // TODO: implement name
  String get name => "myname";

  @override
  void run() {
    print(argResults?.arguments);
    if (argResults?.arguments.indexOf("f") != null) {
      print("hao");
    }
  }
}
