/**
 * WebSocket and HttpGetRequest handlers
 * 
 *
 * WebSocket msg format : <cmd>(=<val>) 
 * see mk312.ino for supported commands
 * 
 * GetRequest examples 
 *   for startRamp:
 *    http://<ip>/RAW?cmd=0x4070&val=0x21
 *    http://<ip>/EXEC?cmd=startRamp
 *   
 *   for setting Channel A level: 
 *    /RAW?cmd=0x4070&val=0x21 (needs to disable adc first with /RAW?cmd=0x400f&val=0x00
 *    /EXEC?cmd=ALevel&val=50   
 *    
 *    
 */

WebSocketsServer webSocket(81);
ESP8266WebServer server(80);

void WSStop()
{
  server.close();
  server.stop();
}

void WSSetup()
{
  server.on("/EXEC", handleHttpGetEXEC);
  server.on("/RAW", handleHttpGetRAW);
  
  server.onNotFound([](){
    if(!handleFileRead(server.uri()))
      server.send(404, "text/plain", "FileNotFound");
  });
  
  server.begin();

  SPIFFS.begin();
  
  webSocket.begin();
  webSocket.onEvent(webSocketEvent);
}

void handleHttpGetRAW()
{
  handleHttpGetBase(true);  
}

void handleHttpGetEXEC() 
{
  handleHttpGetBase(false);
}

void handleHttpGetBase(bool raw) 
{
  String res = "KO";
  
  if(server.hasArg("cmd")) 
  {
    String cmd = server.arg("cmd");

    String val ="";
    if(server.hasArg("val"))
      val = server.arg("val");

    if(raw)
      { poker(StrToHex(cmd.c_str()), StrToHex(val.c_str())); res="OK"; }
    else
      res = mk312_cmd(cmd, val) ?"OK":"KO";    
  }
  
    server.send(200, "text/plain", res);
}


void WSLoop()
{
  webSocket.loop();
  server.handleClient();
}


String getContentType(String filename){
    if(server.hasArg("download")) return "application/octet-stream";
    else if(filename.endsWith(".htm")) return "text/html";
    else if(filename.endsWith(".html")) return "text/html";
    else if(filename.endsWith(".css")) return "text/css";
    else if(filename.endsWith(".js")) return "application/javascript";
    else if(filename.endsWith(".png")) return "image/png";
    else if(filename.endsWith(".gif")) return "image/gif";
    else if(filename.endsWith(".jpg")) return "image/jpeg";
    else if(filename.endsWith(".ico")) return "image/x-icon";
    else if(filename.endsWith(".xml")) return "text/xml";
    else if(filename.endsWith(".pdf")) return "application/x-pdf";
    else if(filename.endsWith(".zip")) return "application/x-zip";
    else if(filename.endsWith(".gz")) return "application/x-gzip";
    return "text/plain";

}

bool handleFileRead(String path){
  #ifdef DEBUG
    Serial.println("handleFileRead: " + path);
  #endif
  if(path.endsWith("/")) path += "index.html";
  if(SPIFFS.exists(path)){
    File file = SPIFFS.open(path, "r");
    size_t sent = server.streamFile(file, getContentType(path));
    file.close();
    return true;
  }
  return false;
  
}

void webSocketEvent(uint8_t num, WStype_t type, uint8_t * payload, size_t length)
{  
   if(type == WStype_CONNECTED){
      IPAddress ip = webSocket.remoteIP(num);

      String message = String("Connected");
      webSocket.broadcastTXT(message);    
    }
    
    if(type == WStype_TEXT)
    {
        String key="";
        String val="";
        bool bval = false;
        
        for(int x = 0; x < length; x++)
        {
          if((((char)payload[x]) == '=')) {bval = true; continue; }
          
          if(bval)  val += (char) payload[x];
          else      key += (char) payload[x];

        }

        //Serial.println("payload:" + payload);

      String res = mk312_cmd(key, val) ?"OK":"KO";

      webSocket.broadcastTXT(key );    
      if(val!="") webSocket.broadcastTXT(val );    
      webSocket.broadcastTXT(res);    
   } 
}
