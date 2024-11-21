import 'package:app_3/appwrite/appwritecontrollers.dart';
import 'package:app_3/pages/profile.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {





  void _logout() {

    Navigator.pushNamedAndRemoveUntil(context, '/login',(Route<dynamic> route) => false, );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: Colors.grey[900],
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color : Colors.orange),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSection(),
              Divider(color: Colors.grey),
              SettingsSection(
                title: 'Account',
                options: [
                  SettingsOption(
                    title: 'Premium plan',
                    subtitle: 'View your plan',
                  ),
                  SettingsOption(
                    title: 'Email',
                    subtitle: 'logan@gmail.com',
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              SettingsSection(
                title: 'Data Saver',
                options: [
                  ToggleOption(
                    title: 'Save Data',
                    description:
                    'Sets audio quality to low, and hides canvases as well as audio & video previews on home.',
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              SettingsSection(
                title: 'Video Podcasts',
                options: [
                  ToggleOption(title: 'Download audio only'),
                  ToggleOption(
                    title: 'Stream audio only',
                    description:
                    'Play video podcasts as audio only when not on Wi-Fi.',
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              SettingsSection(
                title: 'Playback',
                options: [
                  ToggleOption(title: 'Offline mode'),
                  SliderOption(
                    title: 'Crossfade',
                    min: 0,
                    max: 12,
                    initialValue: 6,
                    description: 'Allows you to crossfade between songs',
                  ),
                ],
              ),
              Divider(color: Colors.grey),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button color
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _logout,
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        /*bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex, // Set the current index to highlight selected item
          onTap: _onItemTapped, // Call _onItemTapped when an item is tapped
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Your Library',
            ),
          ],
        ),*/
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/profile.jpg'),
      ),
      title: Text(
        'Logan',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'View Profile',
        style: TextStyle(color: Colors.grey),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => Profile())
        );},
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> options;

  SettingsSection({required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          ...options,
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final String subtitle;

  SettingsOption({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey),
      ),
      onTap: () {
        // Add option tap logic here
      },
    );
  }
}

class ToggleOption extends StatefulWidget {
  final String title;
  final String? description;

  ToggleOption({required this.title, this.description});

  @override
  _ToggleOptionState createState() => _ToggleOptionState();
}

class _ToggleOptionState extends State<ToggleOption> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          value: isToggled,
          activeColor: Colors.orange,
          onChanged: (value) {
            setState(() {
              isToggled = value;
            });
          },
        ),
        if (widget.description != null)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              widget.description!,
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}

class SliderOption extends StatefulWidget {
  final String title;
  final String? description;
  final double min;
  final double max;
  final double initialValue;

  SliderOption({
    required this.title,
    this.description,
    required this.min,
    required this.max,
    required this.initialValue,
  });

  @override
  _SliderOptionState createState() => _SliderOptionState();
}

class _SliderOptionState extends State<SliderOption> {
  double currentValue;

  _SliderOptionState() : currentValue = 0;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Slider(
          value: currentValue,
          min: widget.min,
          max: widget.max,
          divisions: (widget.max - widget.min).toInt(),
          activeColor: Colors.orange,
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
          },
        ),
        if (widget.description != null)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              widget.description!,
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
