@Echo off
Echo Server, wait for 10 seconds and then open browser.
START rails s
TIMEOUT /T 10
START http://localhost:3000/