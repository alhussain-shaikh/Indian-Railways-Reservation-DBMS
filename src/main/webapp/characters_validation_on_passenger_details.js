
function nameValidation() {
    var value = document.form1.name.value;
    if(value.match(/^[a-zA-Z]+(\s{1}[a-zA-Z]+)*$/)) {
        return true;
    } else {
        alert("ONLY characters and one white space is allowed between two names");
        return false;
    }
}