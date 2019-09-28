<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>

<body>
	<div id="time"></div>
	<div id="message"></div>

	<input id="dd" style="width:160px;" placeholder="please input context to flutter"></input><br/><br/>
	<button id="button" style="background-color:#158461;height:30px;">send to flutter</button>

</body>

<script>

	 function sendData(data) {
	window.postMessage(data, '*');
	}
  window.onload = function () {

	    document.getElementById('button').onclick = function () {
	      sendData(document.getElementById('dd').value);
	    }
	  }
</script>
</html>