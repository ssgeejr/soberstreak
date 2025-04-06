<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sober Streak - Login or Create Account</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <div class="container">
        <h1>Welcome to Sober Streak</h1>
        
        <!-- Wrap input fields inside a form element -->
        <form id="loginForm" action="/activeuser" method="POST">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="button-group">
                <!-- Use button type="submit" to submit the form -->
                <button type="submit">Login</button>
            </div>
        </form>

        <div class="link-group">
            <a href="/create.htm">Create an Account</a>
        </div>
    </div>

</body>
</html>
