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
      body: Stack(
          children: [
            Positioned(
              top: 16.0,
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SmallFrame(mediaPath: 'images/jigme.jpg', buttonText: '',caption: 'football is my passion'),
                        SizedBox(height: 16.0),
                        SmallFrame(mediaPath: 'images/pizza.jpg', buttonText: '', caption: 'eating pizza is best'),
                        SizedBox(height: 16.0),
                        SmallFrame(mediaPath: 'images/skateboard.mp4', buttonText: '', caption: 'whenever i am stressed i do skatebaording <3'),
                        SizedBox(height: 16.0),
                        SmallFrame(mediaPath: 'images/bholu.jpg', buttonText: '', caption: 'i love clicking myself with beautiful sunsets'),
                        SizedBox(height: 16.0),
                        SmallFrame(mediaPath: 'images/pinkflower.jpg', buttonText: '', caption: 'gardenning is my hobby'),
                        
                        // Add more SmallFrame widgets as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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

class SmallFrame extends StatefulWidget {
  final String mediaPath;
  final String buttonText;
  final String caption;

  SmallFrame({
    required this.mediaPath,
    required this.buttonText,
    required this.caption,
  });

  @override
  _SmallFrameState createState() => _SmallFrameState();
}

class _SmallFrameState extends State<SmallFrame> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 400.0,
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
              aspectRatio: 16 / 9,
              child: widget.mediaPath.toLowerCase().endsWith('.mp4')
                  ? VideoPlayerWidget(videoPath: widget.mediaPath)
                  : Image.asset(
                      widget.mediaPath,
                      fit: BoxFit.cover,
                      height: 120.0,
                      width: double.infinity,
                    ),
            ),
            SizedBox(height: 8.0),
            // Row to place the button on the right and caption on the left
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Caption on the left
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.caption,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Like button with heart icon on the right
                ElevatedButton(
                  onPressed: () {
                    // Toggle the liked state
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 164, 206, 240),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8.0),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.blue : Colors.white,
                  ),
                ),
              ],
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


