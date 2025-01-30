import 'package:dsw55388/database/dogs_db.dart';
import 'package:dsw55388/database/models/dog.dart';
import 'package:dsw55388/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  Future<List<Dog>>? futureDogs;
  final dogsDB = DogsDB();

  @override
  void initState() {
    super.initState();
    fetchDogs();
  }

  void fetchDogs() {
    setState(() {
      futureDogs = dogsDB.read();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        floatingActionButton: addButton(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              logOutButton(),
              dogsList(),
            ],
          ),
        ),
      ),
    );
  }

  TextButton logOutButton() {
    return TextButton(
      onPressed: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool("isLoggedIn", false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInView()),
        );
      },
      child: const Text(
        "Log out",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  FloatingActionButton addButton() {
    return FloatingActionButton(
      onPressed: () {
        dialogBuilder(context, null);
      },
      child: const Icon(Icons.add),
    );
  }

  Future<void> dialogBuilder(BuildContext context, Dog? dog) {
    final TextEditingController nameController = TextEditingController(
      text: dog?.name ?? ""
    );
    final TextEditingController ageController = TextEditingController(
      text: dog != null ? dog.age.toString() : ""
    );
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dog == null ? "Add new dog" : "Update dog"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(dog == null ? "Add" : "Update"),
              onPressed: () async {
                String name = nameController.text;
                int? age = int.tryParse(ageController.text);

                if (name.isNotEmpty && age != null) {
                  if (dog == null) {
                    Dog newDog = Dog(
                      id: 0,
                      name: name,
                      age: age,
                    );
                    await DogsDB().create(newDog);
                  } else {
                    await DogsDB().update(dog.id, name, age);
                  }
                  fetchDogs();
                }
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  FutureBuilder<List<Dog>> dogsList() {
    return FutureBuilder<List<Dog>>(
      future: futureDogs,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No doggos"));
        } else {
          return ListView.builder(
            shrinkWrap: true, // List invisible without this
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final Dog dog = snapshot.data![index];
              return ListTile(
                title: Text(dog.name),
                subtitle: Text("Age: ${dog.age}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await dogsDB.delete(dog.id);
                    fetchDogs();
                  },
                ),
                onTap: () {
                  dialogBuilder(context, dog);
                },
              );
            },
          );
        }
      },
    );
  }
}