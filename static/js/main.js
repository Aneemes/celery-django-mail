// script.js

document.addEventListener('DOMContentLoaded', function () {
    var confirmationContainer = document.getElementById('confirmation-container');
    
    if (confirmationContainer.innerHTML.trim() !== '') {
        confirmationContainer.style.display = 'block';
        setTimeout(function () {
            confirmationContainer.style.display = 'none';
        }, 5000);
    }

    // Use replaceState to prevent form resubmission prompt on page reload
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
});
