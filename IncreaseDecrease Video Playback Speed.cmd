#Decrease
ffmpeg -hide_banner -y -i ../i.mp4 -vf "setpts=0.09*PTS" ../o.mp4

#Increase
ffmpeg -hide_banner -y -i ../i.mp4 -vf "setpts=2.0*PTS" ../o.mp4