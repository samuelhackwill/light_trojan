
import oscP5.*;
import netP5.*;

import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus


OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(200, 200);
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("172.17.24.225", 12000);
  myBus = new MidiBus(this, 0, "Java Sound Synthesizer"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void draw() {
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
if(number==17){
  OscMessage myMessage = new OscMessage("/test");
  println(value);

  myMessage.add(map(value,0,127,0,1)); /* add an int to the osc message */

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