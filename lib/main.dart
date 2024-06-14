import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class User {
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String email;
  String phoneNumber;
  String countryOfBirth;

  User({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.countryOfBirth,
  });
}

class UserModel extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        title: 'Registration App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => RegistrationForm(),
          '/summary': (context) => SummaryScreen(),
        },
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _countryOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return WideLayout(
                  formKey: _formKey,
                  firstNameController: _firstNameController,
                  middleNameController: _middleNameController,
                  lastNameController: _lastNameController,
                  genderController: _genderController,
                  emailController: _emailController,
                  phoneNumberController: _phoneNumberController,
                  countryOfBirthController: _countryOfBirthController,
                );
              } else {
                return NarrowLayout(
                  formKey: _formKey,
                  firstNameController: _firstNameController,
                  middleNameController: _middleNameController,
                  lastNameController: _lastNameController,
                  genderController: _genderController,
                  emailController: _emailController,
                  phoneNumberController: _phoneNumberController,
                  countryOfBirthController: _countryOfBirthController,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _genderController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _countryOfBirthController.dispose();
    super.dispose();
  }
}

class WideLayout extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController middleNameController;
  final TextEditingController lastNameController;
  final TextEditingController genderController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController countryOfBirthController;

  WideLayout({
    required this.formKey,
    required this.firstNameController,
    required this.middleNameController,
    required this.lastNameController,
    required this.genderController,
    required this.emailController,
    required this.phoneNumberController,
    required this.countryOfBirthController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Color.fromARGB(255, 30, 159, 233), // Set the background color to dodgerblue
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 110, 115, 184),
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text('Home', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Handle Home tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail, color: Colors.white),
                  title:
                      Text('Contact Us', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Handle Contact Us tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title:
                      Text('About Us', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Handle About Us tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.white),
                  title:
                      Text('Location', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Handle Location tap
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: middleNameController,
                    decoration: InputDecoration(labelText: 'Middle Name'),
                  ),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: genderController,
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: countryOfBirthController,
                    decoration: InputDecoration(labelText: 'Country of Birth'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final user = User(
                          firstName: firstNameController.text,
                          middleName: middleNameController.text,
                          lastName: lastNameController.text,
                          gender: genderController.text,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          countryOfBirth: countryOfBirthController.text,
                        );
                        Provider.of<UserModel>(context, listen: false)
                            .setUser(user);
                        Navigator.pushNamed(context, '/summary');
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: middleNameController,
                    decoration: InputDecoration(labelText: 'Middle Name'),
                  ),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: genderController,
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: countryOfBirthController,
                    decoration: InputDecoration(labelText: 'Country of Birth'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final user = User(
                          firstName: firstNameController.text,
                          middleName: middleNameController.text,
                          lastName: lastNameController.text,
                          gender: genderController.text,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          countryOfBirth: countryOfBirthController.text,
                        );
                        Provider.of<UserModel>(context, listen: false)
                            .setUser(user);
                        Navigator.pushNamed(context, '/summary');
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController middleNameController;
  final TextEditingController lastNameController;
  final TextEditingController genderController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController countryOfBirthController;

  NarrowLayout({
    required this.formKey,
    required this.firstNameController,
    required this.middleNameController,
    required this.lastNameController,
    required this.genderController,
    required this.emailController,
    required this.phoneNumberController,
    required this.countryOfBirthController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: middleNameController,
                    decoration: InputDecoration(labelText: 'Middle Name'),
                  ),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: genderController,
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: countryOfBirthController,
                    decoration: InputDecoration(labelText: 'Country of Birth'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final user = User(
                          firstName: firstNameController.text,
                          middleName: middleNameController.text,
                          lastName: lastNameController.text,
                          gender: genderController.text,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          countryOfBirth: countryOfBirthController.text,
                        );
                        Provider.of<UserModel>(context, listen: false)
                            .setUser(user);
                        Navigator.pushNamed(context, '/summary');
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 60,
          child: Center(
            child: Text(
              'Bottom Bar',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context).user;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Summary'),
        ),
        body: Center(
          child: Text('No user information available'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Name: ${user.firstName}',
                    style: TextStyle(fontSize: 18)),
                Text('Middle Name: ${user.middleName}',
                    style: TextStyle(fontSize: 18)),
                Text('Last Name: ${user.lastName}',
                    style: TextStyle(fontSize: 18)),
                Text('Gender: ${user.gender}', style: TextStyle(fontSize: 18)),
                Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
                Text('Phone Number: ${user.phoneNumber}',
                    style: TextStyle(fontSize: 18)),
                Text('Country of Birth: ${user.countryOfBirth}',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
