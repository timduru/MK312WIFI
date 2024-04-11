var Socket;

if(window.location.protocol.startsWith("file")) 
	Socket = new WebSocket('ws://' + '192.168.1.68'+ ':81/');
else  
	Socket = new WebSocket('ws://' + window.location.hostname + ':81/');	



 Socket.onmessage = (event) => 
 {
      const resp = event.data.toString();
		console.log("<== " + resp);
 };
	
function exec(obj, val)
{
	const cmd = obj.id + (typeof(val) == 'undefined' ?"":"=" + val);
	console.log("==> " + cmd);
	Socket.send(cmd);
}

function levels(obj, val)
{
	disableADC.checked=true;
	Socket.send("disableADC=1");
	
	exec(obj, val);
}
