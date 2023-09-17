ffmpeg -hide_banner -y -i "concat:../i.mp4|../i1.mp4|../i2.mp4" -c copy ../o.mp4

ffmpeg -hide_banner -y -f concat -i ../videos.txt -c copy ../oj.mp4