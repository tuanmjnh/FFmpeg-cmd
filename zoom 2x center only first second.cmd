ffmpeg -hide_banner -y -i ../i.mp4 -hide_banner -vf "zoompan=z='if(between(in_time,0,1),2,1)':d=1:x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)'" ../o.mp4