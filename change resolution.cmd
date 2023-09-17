ffmpeg -i ../i.mp4 -hide_banner -filter:v scale=1280:720 -c:a copy ../o.mp4

ffmpeg -i ../i.mp4 -hide_banner -s 1280x720 -c:a copy ../o.mp4