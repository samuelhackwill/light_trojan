
import oscP5.*;
import netP5.*;

import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus


OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(127, 200);
  oscP5 = new OscP5(this, 12001);
  myRemoteLocation = new NetAddress("255.255.255.255", 12000);
  myBus = new MidiBus(this, 0, "Java Sound Synthesizer"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void draw() {
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
if(number==17){
  OscMessage myMessage = new OscMessage("/lighttrojan");
  println(value);

  myMessage.add(map(mouseX, 0, 127, 0, 1));
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
}
  /* if(number==17){
   float val = map(value,0, 127,0,1);
   println(val);
   String[] params={"/usr/local/bin/brightness", str(val)};
   exec(params);
   }
   */
}


void mouseClicked(){
  OscMessage myMessage = new OscMessage("/lighttrojan");
  println(int(mouseX));

  myMessage.add(int(mouseX)); /* add an int to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 


}