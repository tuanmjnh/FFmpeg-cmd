ffmpeg -hide_banner -y -i "../i.mp4" -i "../subtitle.srt" -map 0 -map 1 -c copy -c:v libx264 -crf 23 -preset veryfast "../0.mp4"