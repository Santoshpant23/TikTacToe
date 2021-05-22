import 'package:flutter/material.dart';

class TicTac extends StatefulWidget {
  @override
  _TicTacState createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  //Adding Icons
  var cross = Icon(
    Icons.cancel,
    size: 70,
  );
  var circle = Icon(
    Icons.circle,
    size: 70,
  );
  var edit = Icon(
    Icons.edit,
    size: 70,
  );

  bool isCross = true;
  String message;
  List<String> gameState;

//Initializing
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = " ";
    super.initState();
  }

//To play game
  playgame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  //Reset Game
  resetgame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = " ";
    });
  }

//To get image
  Icon getIcon(String title) {
    switch (title) {
      case ("empty"):
        return edit;
        break;

      case ("cross"):
        return cross;
        break;

      case ("circle"):
        return circle;
        break;
    }
  }

//To check for winning
  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = this.gameState[0] + "wins";
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = this.gameState[3] + "wins";
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = this.gameState[6] + "wins";
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = this.gameState[0] + "wins";
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = this.gameState[1] + "wins";
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = this.gameState[2] + "wins";
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = this.gameState[0] + "wins";
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = this.gameState[2] + "wins";
      });
    } else if (!gameState.contains("empty")) {
      message = "Game Draws";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                        width: 80,
                        height: 80,
                        child: MaterialButton(
                          onPressed: () {
                            this.playgame(i);
                          },
                          child: getIcon(this.gameState[i]),
                        ),
                      ))),
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Column(
            children: [
              MaterialButton(
                color: Colors.green,
                minWidth: 200,
                onPressed: () {
                  resetgame();
                },
                child: Text(
                  "Reset Game",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10,),
              Text("Developed by Santosh Pant")
            ],
          )
        ],
        
      ),
      
    );
  }
}
