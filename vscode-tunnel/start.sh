#!/usr/bin/expect -f

# start the tunnel
spawn ./code tunnel \
    --accept-server-license-terms \
    --name $env(SERVER_NAME)

# default to GitHub auth on first launch
set timeout 10
expect {
    -re ".*GitHub Account.*" {
        send "\033\[B"
        send "\r"
    }
}

# hand control back to user/STDIN/STDOUT
interact
