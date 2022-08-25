function countTime(field, popup){
    let count = $(field).html().split(":");
    if(count[1] == 0){
        count[0] -= 1;
        count[1] = "60";
    }
    count[1] -= 1;
    if(count[1] < 10){
        count[1] = "0"+count[1];
    }
    $(field).html(count[0]+":"+count[1]);
    if(count[0] == 0 && count[1] == 0){
        clearInterval(time);
        time = null;
        $(popup).modal('show');
    }
}

let time = null;

window.clockStart = function(field, popup){
    if(time == null){
        time = setInterval(function(){countTime(field, popup)}, 1000)
    }
}