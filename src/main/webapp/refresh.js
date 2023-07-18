if (localStorage.getItem('loadedOnce') == 'true') {
    // don't reload page, but clear localStorage value so it'll get reloaded next time
    localStorage.removeItem('loadedOnce');
} else {
    // set the flag and reload the page
    localStorage.setItem('loadedOnce', 'true');
    document.location.reload(true);
}