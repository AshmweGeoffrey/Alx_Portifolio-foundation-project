document.addEventListener('DOMContentLoaded', function () {
    const checkboxes = document.querySelectorAll('.checkbox');
    const forms = document.querySelectorAll('.form-container');

    checkboxes.forEach((checkbox, index) => {
        checkbox.addEventListener('click', function () {
            checkboxes.forEach(cb => cb.classList.remove('active'));
            forms.forEach(form => form.classList.remove('active'));

            checkbox.classList.add('active');
            document.getElementById(`form${index + 1}`).classList.add('active');
        });
    });

    document.getElementById('downloadButton').addEventListener('click', function () {
        const element = document.createElement('a');
        const file = new Blob(['Content of the file named c'], { type: 'text/plain' });
        element.href = URL.createObjectURL(file);
        element.download = 'c.txt';
        document.body.appendChild(element); // Required for this to work in FireFox
        element.click();
    });

    // Set the first form (Download Page) as the default active form
    document.getElementById('checkbox1').classList.add('active');
    document.getElementById('form1').classList.add('active');
});

