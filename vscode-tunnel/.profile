# ssh by default as soon as a new interactive terminal is open
case $- in
    *i*)
        echo "Starting ssh session..."
        ssh host.docker.internal
        ;;
esac
