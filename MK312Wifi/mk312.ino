bool mk312_cmd(String cmd, String val)
{
  // todo validate input vals

  if(cmd == "startRamp")
    poker(0x4070, 0x21);
  else if(cmd == "Cut")
    cutVolumes(val.toInt()==1);
  else if(cmd == "disableADC")
    enableADC(val.toInt()!=1);
    
  else if(cmd == "ALevel")
    poker(0x4064,val.toInt());
  else if(cmd == "BLevel")
    poker(0x4065,val.toInt());
    
  else if(cmd == "MultiAdjust")
    poker(0x420d, 255 - val.toInt());
  else if(cmd == "Mode")
  {
    poker(0x407b,StrToHex(val.c_str())); 
    poker(0x4070,0x4); 
    poker(0x4070,0x12); // 18 execute mode
  }

  
  mySerial.flush();
  return true;
}

void cutVolumes(bool enabled)
{ 
  if(enabled)
  {
    enableADC(false);
    mk312_cmd("ALevel", "0x00");
    mk312_cmd("BLevel", "0x00");
  }
  else
  {
    enableADC(true);
  }

}

void enableADC(bool enabled)
{
  poker(0x400f,enabled?0x00:0x01); 
}

int StrToHex(const char str[]) {
    return (int) strtol(str, 0, 16);
}
