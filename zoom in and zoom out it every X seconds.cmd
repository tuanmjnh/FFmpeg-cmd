# Once FFmpeg is installed, go to the location where you've saved the video and run the following command to zoom in and zoom out it every X seconds:
ffmpeg -hide_banner -y -i ../i.mp4 -vf "zoompan=z='if(lte(mod(time,10),3),2,1)':d=1:x=iw/2-(iw/zoom/2):y=ih/2-(ih/zoom/2):fps=30" ../o.mp4

The above command will zoom in toward the center of the video to 2x zoom for the first 3 seconds of every 10 second block of time. Replace input.mp4 with your filename. Also adjust the values as per your requirement and set the FPS for the filter to match the input. The default value is 25.

You can find the FPS details among other details of a given video using the following command:
ffmpeg -i ../i.mp4