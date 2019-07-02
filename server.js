var http = require("http");
var echarts = require('node-echarts-canvas');
var url = require("url");
var server = http.createServer(function(req,res){
    var arg = url.parse(req.url, true).query;
    if(!arg.config){
        res.end('request parameter "config" error');
        return
    }
    try{
        config = JSON.parse(arg.config)
    }catch(e){
        console.log(e)
    }

    if(!config.option){
        res.end('request parameter "config" error');
        return
    }

    var buffer = echarts({
        option: config.option,
        width:  config.width || 600,
        height: config.height || 400,
    })
    res.setHeader('Content-Type','image/png');
    res.write(buffer)
    res.end();
});

var hostName = '0.0.0.0';
var port = 80;
server.listen(port, hostName, function(){
    console.log(`server started at port ${port}`);
});