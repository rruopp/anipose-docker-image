docker run -it --rm --runtime=nvidia \
	-e DISPLAY=${DISPLAY} \
	-e XAUTHORITY=/root/.Xauthority \
	-v /run/user/1000/gdm/Xauthority:/root/.Xauthority:ro \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /home/rubi:/home/rubi \
	dlc /bin/bash
