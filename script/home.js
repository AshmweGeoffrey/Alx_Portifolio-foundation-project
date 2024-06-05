window.onload = function() {
    // Get all the containers
    var containers = document.querySelectorAll('#container-2, #container-3, #container-4');
    alert(containers.length);

    // Add a click event listener to each container
    for (var i = 0; i < containers.length; i++) {
        containers[i].addEventListener('click', function(event) {
            alert('A container was clicked.');
            // Toggle 'hidden' class on the clicked container
            event.currentTarget.classList.add('available');
        });
    }
};