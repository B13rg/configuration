#!/bin/sh
# Detect scene changes in video
# Saves first frame and timecodes to file.
ffmpeg -i inputvideo.mp4 -filter_complex \"select='gt(scene,0.3)',metadata=print:file=time.txt\" -vsync vfr img%03d.png
