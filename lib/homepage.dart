import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'message.dart';
//import 'search.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hobby Connect',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontFamily: 'BethEllen',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              'images/bg.png', // Replace with your image path
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            // Main Content
            PlaceholderWidget(_currentIndex),
            // Small Frames
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallFrame(mediaPath: 'images/jigme.jpg', buttonText: 'like'),
                  SizedBox(height: 16.0),
                  SmallFrame(mediaPath: 'images/pizza.jpg', buttonText: 'like'),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallFrame(mediaPath: 'images/skateboard.mp4', buttonText: 'like'),
                  SizedBox(height: 16.0),
                  // Add more SmallFrame widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _navigateToScreen(index);
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
      ),
    );
  }

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        // Navigate to Home page (if you have a Home page)
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationsPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      default:
        break;
    }
  }
}

class PlaceholderWidget extends StatelessWidget {
  final int index;

  PlaceholderWidget(this.index);

  @override
  Widget build(BuildContext context) {
    String pageName = 'Unknown Page';

    switch (index) {
      case 0:
        pageName = 'Home Page';
        break;
      case 1:
        pageName = 'Search Page';
        break;
      case 2:
        pageName = 'Notifications Page';
        break;
      case 3:
        pageName = 'Profile Page';
        break;
      default:
        break;
    }

    return Center(
      child: Text(
        'This is the $pageName',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Center(
        child: Text('Search Page Content'),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Page'),
      ),
      body: Center(
        child: Text('Notifications Page Content'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Text('Profile Page Content'),
      ),
    );
  }
}

class SmallFrame extends StatelessWidget {
  final String mediaPath;
  final String buttonText;

  SmallFrame({
    required this.mediaPath,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Image or Video
            AspectRatio(
              aspectRatio: 16 / 9, // Adjust the aspect ratio as needed for videos
              child: mediaPath.toLowerCase().endsWith('.mp4')
                  ? VideoPlayerWidget(videoPath: mediaPath)
                  : Image.asset(
                      mediaPath,
                      fit: BoxFit.cover,
                      height: 120.0, // Set the height of the image
                      width: double.infinity,
                    ),
            ),
            SizedBox(height: 8.0),
            // Button
            ElevatedButton(
              onPressed: () {
                // Add your functionality here when the button is pressed
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  VideoPlayerWidget({required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize();

    _initializeVideoPlayerFuture.then((_) {
      // Ensure the first frame is shown after the video is initialized
      setState(() {});
    });

    // Optional: Set looping if needed
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : CircularProgressIndicator();
  }
}


