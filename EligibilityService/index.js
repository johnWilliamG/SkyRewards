var express = require("express");
var util = require('util');
var app = express();

var port = 4000;


function processRequestWithCustomerID ( subs ) {

  var arrayOfChannels = subs.split(',');
  var arrayOfRewards = [];

  arrayOfChannels.forEach( function( channel ) {
    switch (channel) {
      case "SPORTS":
        arrayOfRewards.push("CHAMPIONS_LEAGUE_FINAL_TICKET");
        break;
      case "MUSIC":
        arrayOfRewards.push("KARAOKE_PRO_MICROPHONE");
        break;
      case "MOVIES":
        arrayOfRewards.push("PIRATES_OF_THE_CARRIBEAN_COLLECTION");
        break;
      case "KIDS":
        break;
      case "NEWS":
        break;
      default:
        console.log("Invalid Channel: "+channel);
        break;
    }
  })

  return { Rewards : arrayOfRewards };
}

app.get("/", function(req, res) {

  if (req.headers.customerid) {

    res.send(processRequestWithCustomerID(req.headers.subscritpions));
  } else {

    res.send("No Valid CustomerID");
  }
});


app.listen(port, function() {
  console.log("app was listening on "+ port);
});
