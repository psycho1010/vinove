import 'package:flutter/material.dart';
import 'package:flutter_project2/map_screen.dart';
import 'package:flutter_project2/map_screen3.dart'; 
import 'package:flutter_project2/map_screen2.dart';
import 'member.dart';

const Color ombrePurpleStart = Color(0xFF6A1B9A); // Deep Purple
const Color ombrePurpleMid = Color(0xFF8E24AA); // Medium Purple
const Color ombrePurpleEnd = Color(0xFFD81B60); // Pinkish Purple
const Color ombreAccent = Color(0xFFF06292); // Light Purple-Pink Accent
const Color backgroundLight =
Color(0xFFF3E5F5); // Very Light Purple for backgrounds
const Color textLight = Colors.white; // Light text
const Color textDark = Colors.black87;

class AttendanceScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Attendance",
            style: TextStyle(
                color: textLight, fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: ombrePurpleStart,
        leading: IconButton(
          icon: Icon(Icons.menu,color: textLight,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: ombrePurpleStart,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Row(
                  children: [
                    Icon(
                      Icons.av_timer, // Replace with the desired icon
                      color: textLight,
                      size: 24, // Adjust size as needed
                    ),
                    SizedBox(width: 2),
                    Text(
                      'WayPoint',
                      style: TextStyle(
                        color: textLight,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
      const SizedBox(height: 10),
      Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
                'assets/images/profile.jpeg'), // Replace with your image path
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Vinove',
                style: TextStyle(color: textLight, fontSize: 16),
              ),
              Text(
                'vinove@gmail.com',
                style: TextStyle(color: textLight),
              ),
            ],
          ),
        ],
      ),
      ],

            ),
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Timer'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Attendance'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Activity'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.timer_outlined),
              title: Text('Timesheet'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text('Report'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Jobsite'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Team'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Time off'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Schedules'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.how_to_reg),
              title: Text('Request to Join Organisation'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
            Divider(), 
            ListTile(
              leading: Icon(Icons.help),
              title: Text('FAQ & Help'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              onTap: () {
                // Handle logout
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Version: 2,10(2)'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: fakeMembers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            // "All Members" row
            return Container(
              color: Colors.grey[200],
              child: ListTile(
                leading: Icon(
                  Icons.groups,
                ),
                title: Text(
                  "All Members",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AllMembersScreen(), 
                    ),
                  );
                },
              ),
            );
          }
          final member = fakeMembers[index - 1];
          return ListTile(
            leading: CircleAvatar(
              radius: 18,
              backgroundImage: member.profileImg.image,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${member.name} (${member.id})",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                // Check if the user has checked in
                if (member.checkInTime == null)
                // If no check-in time, display "Not Logged-In Yet"
                  Text(
                    "Not Logged-In Yet",
                    style: TextStyle(color: Colors.grey),
                  )
                else if (member.checkOutTime == null)
                // If user has checked in but not checked out, display "Working"
                  Row(
                    children: [
                      // Green arrow before checkInTime
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(member.checkInTime ?? "Not Available"),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.error,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Text("Working", style: TextStyle(color: Colors.orange)),
                    ],
                  )
                else
                // If the user has checked in and out, show both times
                  Row(
                    children: [
                      // Green arrow before checkInTime
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(member.checkInTime ?? "Not Available"),

                      const SizedBox(width: 16),
                      // Add spacing between the times

                      // Red arrow before checkOutTime
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(member.checkOutTime ?? "Not Available"),
                    ],
                  ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today,
                      color: const Color.fromARGB(255, 96, 39, 176)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen2(
                          name: member.name,
                          latitude: member.latitude, 
                          longitude: member.longitude,
                          visitedPlaces:
                              member.visitedPlaces, 
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.my_location, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(
                          latitude: member.latitude,
                          longitude: member.longitude,
                          name: member.name,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapScreen3(
                  members: fakeMembers, 
                ),
              ),
            );
          },
          child: Text('Show All Members on Map'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 251, 232, 254),
          ),
        ),
      ),
    );
  }
}

class AllMembersScreen extends StatefulWidget {
  @override
  _AllMembersScreenState createState() => _AllMembersScreenState();
}

class _AllMembersScreenState extends State<AllMembersScreen> {
  List<Member> filteredMembers = fakeMembers;
  TextEditingController _searchController = TextEditingController();

  void _filterMembers(String query) {
    setState(() {
      filteredMembers = fakeMembers.where((member) {
        return member.name.toLowerCase().contains(query.toLowerCase()) ||
            member.id.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterMembers(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // AppBar Section
          AppBar(
            title: Text(
              "Members",
              style: TextStyle(
                color: textLight,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: ombrePurpleStart, // Set AppBar background to blue
          ),
          // Search Bar Section
          Container(
            color: textLight,
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Members',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
          ),
          // List of Members
          Expanded(
            child: ListView.builder(
              itemCount: filteredMembers.length,
              itemBuilder: (context, index) {
                final member = filteredMembers[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundImage: member.profileImg.image,
                  ),
                  title: Text(member.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
