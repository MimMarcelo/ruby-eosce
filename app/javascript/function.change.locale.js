window.changeLocale = function(field, baseUrl, fullUrl){
    let url = baseUrl + "/" + $(field).val();

    url += fullUrl.substring(baseUrl.length+3);
    window.location = url;
    // console.log(url);
}