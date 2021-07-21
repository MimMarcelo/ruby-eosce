
window.addValue = function(btn, value, next = true){
    let field = $(btn).next();
    if(!next){
        field = $(btn).prev();
    }
    let prevValue = parseInt($(field).val());
    if(isNaN(prevValue)){
        prevValue = 0;
    }
    let newValue = prevValue+value;
    if(newValue < $(field).attr("min")){
        newValue = $(field).attr("min");
    }
    $(field).val(newValue);
    // console.log($(btn).next().val());
    // console.log($(this).next().val());
}