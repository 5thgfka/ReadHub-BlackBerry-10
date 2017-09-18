import bb.cascades 1.4

QtObject {
    
    function ajax(method, endpoint, paramsArray, callback, customheader, form) {
        console.log(method + "//" + endpoint + JSON.stringify(paramsArray))
        // append
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status == 200) {
                    if (request.responseText == "0") {
                        callback(false, "Network unreachable");
                    } else {
                        callback(true, request.responseText);
                    }
                } else {
                    console.log("[AJAX]Status: " + request.status + ", Status Text: " + request.statusText);
                    callback(false, request.statusText);
                }
            }
        };
        var params = paramsArray.join("&");
        var url = endpoint;
        if (method == "GET" && params.length > 0) {
            url = url + "?" + params;
        }
        request.open(method, url, true);
        if (form) {
            request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        }
        request.setRequestHeader("Platform", "BlackBerry 10");
        
        if (customheader) {
            for (var i = 0; i < customheader.length; i ++) {
                request.setRequestHeader(customheader[i].k, customheader[i].v);
            }
        }
        if (method == "GET") {
            request.send();
        } else {
            request.send(params);
        }
    }
}