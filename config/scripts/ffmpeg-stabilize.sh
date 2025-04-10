ffmpeg -i "$1" -vf vidstabdetect=shakiness=5:show=1 dummy.avi

ffmpeg -i "$1" -vf yadif, format=yuv420p, vidstabtransform=zoom=2:optzoom=0:crop=black -c:v libx264 -b:a 32k stabilized264.mp4