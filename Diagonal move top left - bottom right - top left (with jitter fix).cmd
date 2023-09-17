→ ffmpeg -i input.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.90:in_h*0.90:'if(lt(t,5),in_w*0.10/5*t,1920-in_w*0.10/5*(t-5))':'if(lt(t,5),in_h*0.10/5*t,1080-in_h*0.10/5*(t-5))',scale=hd1080" output03.mp4 

with:
* -i input.mp4 = Reads file «input.mp4» and …
* -vf = … and applies video filters (vf)…
* scale=iw*10:ih*10 = … the video is first scaled up to 19200x10800…
* crop = … then a rectangular piece of the video is cut (crop)…
* in_w*0.90:in_h*0.90 = … that is 90% the size of the scaled up video.
* 'if(lt(t,5),in_w*0.10/5*t,1920-in_w*0.10/5*(t-5))' = Cut position on the x axis starts at 0 then: increases by 2% video width for the first 5 (t) seconds, decreases by 2% video width for the last 5 (t) seconds. 
* 'if(lt(t,5),in_h*0.10/5*t,1080-in_h*0.10/5*(t-5))' = Cut position on the y axis starts at 0 then: increases by 2% video height for the first 5 (t) seconds, decreases by 2% video height for the last 5 (t) seconds. 
* scale=hd1080 = The video is then scaled down to 1920x1080 (hd1080)…
* output03.mp4 = … and outputs the result to file «output03.mp4»