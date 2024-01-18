import 'dart:math';

import 'package:flutter/material.dart';

class HeroImageAnimation extends StatefulWidget {
  const HeroImageAnimation({super.key});

  @override
  State<HeroImageAnimation> createState() => _HeroImageAnimationState();
}

class _HeroImageAnimationState extends State<HeroImageAnimation> with TickerProviderStateMixin {
  late AnimationController xController;
  late AnimationController yController;
  late AnimationController zController;
  late Tween<double> animation;

  @override
  void initState() {
    super.initState();
    xController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    yController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );
    zController = AnimationController(
      duration: const Duration(seconds: 40),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    xController.dispose();
    yController.dispose();
    zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    xController
      ..reset()
      ..repeat();

    yController
      ..reset()
      ..repeat();

    zController
      ..reset()
      ..repeat();

    const widthAndHeight = 100.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    person: person,
                  ),
                ),
              );
            },
            leading: Hero(
              tag: person.name,
              child: Text(
                person.emoji,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            title: Text(
              person.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              '${person.age} years old',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}

class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

const people = [
  Person(
    name: 'John',
    age: 20,
    emoji: '👨‍🦱',
  ),
  Person(
    name: 'Jane',
    age: 25,
    emoji: '👩‍🦰',
  ),
  Person(
    name: 'Jack',
    age: 30,
    emoji: '👨‍🦲',
  ),
  Person(
    name: 'Jill',
    age: 35,
    emoji: '👩‍🦳',
  ),
];

class DetailsPage extends StatelessWidget {
  final Person person;
  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          flightShuttleBuilder: (flightContext, animation, direction, fromContext, toContext) {
            switch (direction) {
              case HeroFlightDirection.push:
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: 0.0,
                        end: 1,
                      ).chain(
                        CurveTween(
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    child: Text(
                      person.emoji,
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: Text(
                    person.emoji,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                );
            }
          },
          tag: person.name,
          child: Material(
            color: Colors.transparent,
            child: Text(
              person.emoji,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              person.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '${person.age} years old',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
