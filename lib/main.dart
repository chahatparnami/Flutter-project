import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: MyHome(),
  ));
}
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
          ],
          title: Center(
            child: Text(
              'My Media Player', 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 24,
                color: Colors.white70,
                ),
                ),
                ),
                backgroundColor: Colors.black87,
                elevation: 30,
                brightness: Brightness.dark,

        ),
        body: Container(
          color: Colors.brown,
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(0),
          
          child: Stack(
            
          alignment: Alignment.topCenter,
            children: <Widget>[
              Container(               
                margin: EdgeInsets.only(top: 30),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.horizontal(),
                  image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/photos/cute-brown-french-bulldog-sitting-on-the-bed-at-home-and-looking-at-picture-id1204697549?b=1&k=6&m=1204697549&s=170667a&w=0&h=sng_GsbIC6vZ5_44koaYj55TqTKD1aqXcCRMFglnk9E='), fit: BoxFit.fill,),
                  ),
              ),
              Container(
                height: double.infinity,
                 width: double.infinity,   
                 child: Center(child: Text('MY FAVOURITE TRACK ', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),))                          
              ),
              Container(
                
                margin: EdgeInsets.only(top: 340.0),
                width: 100,
                child: Row( 
                  
                  
                  children: <Widget>[
                    IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.black87, size: 60,),
                  onPressed: () async {
                    int result = await audioPlayer.play("https://ipendu.com/data/128/Hindi-Singles/15825/Tere%20Naal%20-%20iPendu.Com.mp3");//https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3
                     if (result == 1) {
                       // success
                      } 
                    if(isPlaying){
                       audioPlayer.pause();

                      setState(() {
                        isPlaying = false;
                      });
                    }else{
                       audioPlayer.resume();

                      setState(() {
                        isPlaying = true;
                      });
                    }

                  },
                )  ,
                IconButton(
                  icon: Icon(Icons.stop, color: Colors.black87, size: 60,),
                  onPressed: (){
                    audioPlayer.stop();

                    setState(() {
                      isPlaying = false;
                    });

                  },
                ),

                  ],
                )
              ),
               Container(
                
          margin: EdgeInsets.only(top: 520.0),
          width: 350,
          //height: 650,
           child: Row(
             children: <Widget>[
              IconButton(
                icon: Icon(Icons.video_library, color: Colors.black, size: 60,),
                  onPressed: (){
                    Navigator.push(
                    context,
                   MaterialPageRoute(builder: (context) => VideoPage()),
                    );
                  },),])), 
            ],
          ),
        ),
                floatingActionButton: FloatingActionButton(child: Icon(Icons.music_note),backgroundColor: Colors.black87, onPressed: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );

            })
    );
            }
}
class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  static AudioPlayer newPlayer = new AudioPlayer();
  AudioCache audioCache = new AudioCache(fixedPlayer: newPlayer);
  bool play = false;
  bool stop = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My favourites'),
        backgroundColor: Colors.black,
        ),
        body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  color: Colors.blue,
                                  width: 50.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                          title:
                                              Text('JANNAT'),
                                        ),
                                        Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: Row( 
                                          children: <Widget>[
                                           IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(play ? Icons.pause : Icons.play_arrow, color: Colors.black87, size: 60,),
                                            onPressed: ()  {
                                              audioCache.play('audios/shayad.mp3', isNotification: true);
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                              else{
                                                newPlayer.resume();

                                                setState(() {
                                                  play = true;
                                                     });
                                              }
                                            },),
                                            IconButton(
                                              icon: Icon(Icons.stop, color: Colors.black87, size: 60,),
                                               onPressed: (){
                                               newPlayer.stop();
                                               setState(() {
                                               play = false;
                                              });

                                             },
                                          
                                          
                                          
                                          
                                        ),
                                          ]),
                                        ))],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.blue,
                                  width: 50.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                          title:
                                              Text('SHAYAD'),
                                        ),
                                        Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ), 
                                          child: Row( 
                                            children: <Widget>[
                                              IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(play ? Icons.pause : Icons.play_arrow, color: Colors.black87, size: 60,),
                                            onPressed: ()  {
                                              audioCache.play('audios/Jannat.mp3', isNotification: true);
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                              else{
                                                newPlayer.resume();

                                                setState(() {
                                                  play = true;
                                                     });
                                              }
                                            },
                                           
                                          ),
                                           IconButton(
                                              icon: Icon(Icons.stop, color: Colors.black87, size: 60,),
                                               onPressed: (){
                                               newPlayer.stop();
                                               setState(() {
                                               play = false;
                                              });

                                             },
                                          
                                          ),]
                                          
                                          
                                        ),
                                      ),
                                        )],
                                    ),
                                  ),
                                  ),
                                  Container(
                                  color: Colors.blue,
                                  width: 50.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                          title:
                                              Text('SAARI KI SAARI'),
                                        ),
                                        Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                               IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(play ? Icons.pause : Icons.play_arrow, color: Colors.black87, size: 60,),
                                            onPressed: ()  {
                                              audioCache.play('audios/Saari Ki Saari.mp3', isNotification: true);
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                              else{
                                                newPlayer.resume();

                                                setState(() {
                                                  play = true;
                                                     });
                                              }
                                            },
                                           
                                          ),
                                           IconButton(
                                              icon: Icon(Icons.stop, color: Colors.black87, size: 60,),
                                               onPressed: (){
                                               newPlayer.stop();
                                               setState(() {
                                               play = false;
                                              });

                                             },
                                          
                                          ),
                                            ] 
                                        ),
                                            ),
                                        )],
                                    ),
                                  ),
                                  ),

                                  ],),))],))],))]),));
                                }
                

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: VideoPage(),
    );
  }
}

class VideoPage extends StatefulWidget {
  VideoPage({Key key, this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<VideoPage> {

  VideoPlayerController playerController;
  VideoPlayerController playerController1;
  VoidCallback listener;
  @override
  void initState() {
     playerController = VideoPlayerController.asset('assets/video/no1.mp4');


      playerController.addListener(listener);
      playerController.setVolume(1.0);
      playerController.initialize();
      playerController.play();
    super.initState();

    listener= () {
      setState(() {

      });
    };
  }


  @override
  void deactivate() {
    playerController.setVolume(1.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),

      ),
      body: Container(
        color: Colors.grey.shade500,
          child: Stack(
            
            alignment: Alignment.topCenter,
              children: <Widget>[
              
               AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(

                  child: (playerController != null  ? VideoPlayer
                    ( playerController,
                  ) : Container()  ),


                ),

              ),
              Container(
                  width: 50,
                  height: 20,
                child: RaisedButton(

                  onPressed: (){
                    setState(() {
                      if (playerController.value.isPlaying) {
                          playerController.pause();
            } else {
              playerController.play();
            }
                    }
                    );},
                  child: Card(
                    child: Text('PLAY'),
                    color: Colors.green,
                    elevation: 6,

                  ),
                )
                
                
              ),
            ]
          ),
          ),
      );
  }
}