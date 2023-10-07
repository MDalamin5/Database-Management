document.getElementById('registration-form').addEventListener('submit', function (e) {
    e.preventDefault();

    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // You can send this data to your PHP backend for registration
    // For example, using the Fetch API to make a POST request.
});
