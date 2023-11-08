import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a list of SmallFrame objects with different properties
    List<SmallFrame> smallFrames = [
      SmallFrame(
        mediaPath: 'images/view1.png',
        buttonText: '',
        caption: 'roaming is my best stuff #view',
      ),
      SmallFrame(
        mediaPath: 'images/saloni.jpg',
        buttonText: '',
        caption: 'living myself a lil more #people',
      ),
      SmallFrame(
        mediaPath: 'images/duck.png',
        buttonText: '',
        caption: 'kwak kwak #animals',
      ),
      SmallFrame(
        mediaPath: 'images/view2.png',
        buttonText: '',
        caption: 'nature heals #view',
      ),
      SmallFrame(
        mediaPath: 'images/laalkila.png',
        buttonText: '',
        caption: 'historical places above all #building',
      ),
      SmallFrame(
        mediaPath: 'images/view3.png',
        buttonText: '',
        caption: 'livin in the moment #view',
      ),
      SmallFrame(
        mediaPath: 'images/animedraw.png',
        buttonText: '',
        caption: 'anime is evrythin',
      ),
      SmallFrame(
        mediaPath: 'images/jigme.jpg',
        buttonText: '',
        caption: 'football is everything #football',
      ),
      SmallFrame(
        mediaPath: 'images/pinkflower.jpg',
        buttonText: '',
        caption: 'gardening #flower',
      ),
      SmallFrame(
        mediaPath: 'images/bholu.jpg',
        buttonText: '',
        caption: 'life is all about travel with nature #people',
      ),
      // Add more SmallFrame objects as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40.0,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Type here.......',
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Color.fromARGB(255, 164, 206, 240),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: smallFrames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: smallFrames[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
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
      width: MediaQuery.of(context).size.width / 4, // Adjust the width as needed
      child: Wrap(
        children: [
          // Image or Video
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(widget.mediaPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          // Column to place the button on the bottom and caption on the top
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Like button with heart icon on the bottom
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
              SizedBox(height: 8.0),
              // Caption on the top
              Padding(
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
            ],
          ),
        ],
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
