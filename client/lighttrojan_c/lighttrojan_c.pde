import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(200, 200);
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("172.17.24.225", 12000);
}

void draw() {
}

/* if(number==17){
 float val = map(value,0, 127,0,1);
 println(val);
 
 if (val < 50){val = 0;}
 else {val = 1;}
 String[] params={"/usr/local/bin/xbacklight", "-set", str(val)};
 exec(params);
 }
 */

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());

  if (theOscMessage.checkAddrPattern("/lighttrojan")==true) {

    int v = theOscMessage.get(0).intValue();
    print(v);
    
    if (v < 10) {
      String[] params={"/usr/local/bin/brightness", str(0)};
      exec(params);
    }

    if (v > 100) {
      String[] params={"/usr/local/bin/brightness", str(1)};
      exec(params);
    }
    
  }
}