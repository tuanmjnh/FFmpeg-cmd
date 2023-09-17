ffmpeg -i ../i.mp4 -hide_banner -c copy -map 0 -segment_time 00:00:02 -f segment -reset_timestamps 1 ../o%03d.mp4

ffmpeg -hide_banner -y -i ../i.mp4 -ss 00:00:00 -to 00:00:03 -c copy ../o1.mp4
ffmpeg -hide_banner -y -i ../i.mp4 -ss 00:00:03 -to 00:00:06 -c copy ../o2.mp4
ffmpeg -hide_banner -y -i ../i.mp4 -ss 00:00:06 -to 00:00:09 -c copy ../o3.mp4

/**
* -i  input file
* -ss start time in seconds or in hh:mm:ss
* -to end time in seconds or in hh:mm:ss
* -c codec to use
*/