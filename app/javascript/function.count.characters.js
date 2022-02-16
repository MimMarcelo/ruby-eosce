window.countCharacters = function(field, max){
    let counter = $(field).next();
    
    $(counter).text($(field).val().length + "/" + max);
}