ffmpeg -hide_banner -y -i ../i.mp4 -vf "zoompan=z='if(lte(mod(time,10),3),2,1)':d=1:x=iw/2-(iw/zoom/2):y=ih/2-(ih/zoom/2):fps=30" ../o.mp4



ffmpeg -hide_banner -y -i ../i.mp4 -ss 00:00:03 -t 00:00:05 -filter_script:v:0 crop-filter-script.txt -c copy ../o.mp4


ffmpeg -hide_banner -y -i ../i.mp4 -filter_complex_script cropfile_debug.txt -map [out] -map 0:a:0 -c copy o.mp4

ffmpeg -hide_banner -y -i ../i.mp4 -f lavfi -i color=s=1280x720:c=black:r=25 -filter_complex_script cropfile_debug.txt -map [out] -map 0:a:0 -preset veryfast ../o.mp4

[1][0]overlay=x='-838*between(t\,0.000000\,0.200000)+-788*between(t\,0.200001\,0.300000)+-719*between(t\,0.300001\,0.400000)':y=-0:shortest=1[out]


ffmpeg -hide_banner -y -i ../i.mp4 -f lavfi -i color=s=1280x720:c=black:r=25 -filter_complex "[1][0] overlay=x='-1080*between(t\,0.000000\,0.200000)+-960*between(t\,0.200001\,0.300000)+-880*between(t\,0.300001\,0.400000)':y=-0:shortest=1" -preset veryfast ../o.mp4


ffmpeg  -i 1080x1920.mov -i 1280x720.MOV -filter_complex "[1]scale=1080:-1,pad=1080:1920:0:1920-500-607[1v];[1v][0]overlay=0:0" -c:v libx264 -profile:v high444 -pix_fmt yuv420p -level 3.1 -y final.mp4

ffmpeg -i ../i.mp4 -filter:v scale=1080:1920 -c:a copy ../o.mp4

ffmpeg -hide_banner -y -i ../i.mp4 -vf "zoompan=z='min(zoom+0.01,1.5)':x='if(lte(on,50),(iw-iw/zoom)/2,x+10)':y='if(lte(on,50),(ih-ih/zoom)/2,y)':s=1280x720:d=250" -c copy ../o.mp4

ffmpeg -i ../i.mp4 -filter_complex overlay=x='(W-w)*(T/2-abs(mod(t,T)-T/2))/(T/2)':y=H-h-20 ../o.mp4

ffmpeg -i ../i.mp4 -filter_complex overlay=x='(W-w)*(6/2-abs(mod(t\,6)-6/2))/(6/2)':y=H-h-20 ../o.mp4

#Horizontal move: left - right
ffmpeg -hide_banner -y -i ../i.mp4 -vf "crop=in_w*0.90:in_h*0.90:(in_w*0.10)/10*t:108,scale=1920:1080" ../o.mp4

#Vertical move: up - down - up (with jitter fix)
ffmpeg -hide_banner -y -i ../i.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.90:in_h*0.90:1920:'if(lt(t,5),in_h*0.10/5*t,1080-in_h*0.10/5*(t-5))',scale=hd1080" ../o.mp4

#Diagonal move: top left - bottom right - top left (with jitter fix)
ffmpeg -hide_banner -y -i ../i.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.90:in_h*0.90:'if(lt(t,5),in_w*0.10/5*t,1920-in_w*0.10/5*(t-5))':'if(lt(t,5),in_h*0.10/5*t,1080-in_h*0.10/5*(t-5))',scale=hd1080" ../o.mp4

#Diagonal move: top left - bottom right - top left (with jitter fix) - TM
ffmpeg -hide_banner -y -i ../i.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lte(mod(t,10),0),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lte(mod(t,10),3),in_h*0.10/3*(t/5),1080-in_h*0.10/3*(t/5-5))',scale=hd1080" ../o.mp4



ffmpeg -hide_banner -y -i ../i.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lt(t,5),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lt(t,5),in_h*0.10/3*t,1080-in_h*0.10/3*(t-5))',scale=hd1080" -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(between(t,10,20),in_w*0.10/2*(t/10),1920-in_w*0.10/2*(t/10-5))':'if(between(t,10,20),in_h*0.10/2*(t-10),1080-in_h*0.10/2*(t-10-5))',scale=hd1080'" ../o.mp4

ffmpeg -hide_banner -y -i ../i.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lt(t,5),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lt(t,5),in_h*0.10/3*t,1080-in_h*0.10/3*(t-5))',scale=hd1080" ../o.mp4
ffmpeg -hide_banner -y -i ../o.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(between(t,10,20),in_w*0.10/2*(t-10),1920-in_w*0.10/2*(t-10-5))':'if(between(t,10,20),in_h*0.10/2*(t-10),1080-in_h*0.10/2*(t-10-5))',scale=hd1080'" ../oo.mp4


ffmpeg -hide_banner -y -i ../i.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lt(t,5),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lt(t,5),in_h*0.10/2*t,1080-in_h*0.10/2*(t-5))',scale=hd1080" ../o.mp4


ffmpeg -i ../i.mp4  -filter_complex "[0:v]crop='if(gte(iw,ih),ih,iw):if(gte(ih,iw),iw,ih)',scale=720x720,split=3[1v][2v][3v]; [1v]trim=0:4.95,setpts=PTS-STARTPTS[v1]; [2v]trim=4.95:6.75,setpts=(PTS-STARTPTS)/0.1[v2]; [3v]trim=6.75:8,setpts=PTS-STARTPTS[v3]; [v1][v2][v3]concat=n=3:v=1:a=0[out]" -map [out] -an -c:v libx264 -profile:v high -level 4.1 -crf 20 -r 30 ../o.mp4

ffmpeg -hide_banner -y -i ../i.mp4 -filter_complex "[0:v]scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lt(t,5),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lt(t,5),in_h*0.10/3*t,1080-in_h*0.10/3*(t-5))',scale=hd1080,split=3[1v][2v][3v]; [1v]trim=0:10,setpts=PTS-STARTPTS[v1]; [2v]trim=10:20,setpts=(PTS-STARTPTS)/0.1[v2]; [3v]trim=start=20,setpts=PTS-STARTPTS[v3]; [v1][v2][v3]concat=n=3:v=1:a=0[out]" -map [out] -an -c:v libx264 -profile:v high -level 4.1 -crf 20 -r 30 ../o.mp4


ffmpeg -hide_banner -y -i ../i.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.50:in_h*0.80:'if(lt(t,20),in_w*0.10/2*t,1920-in_w*0.10/1*(t-25))':'if(lt(t,20),in_h*0.10/4*t,1080-in_h*0.10/2*(t-10))',scale=1080:1920" ../o.mp4

ffmpeg -hide_banner -y -i ../i.mp4 -vf "scale=iw*10:ih*10,crop=ih*(9/16):in_h*0.80:'if(lt(t,20),in_w*0.10/2*(t+2),1920-in_w*0.10/1*(t-22))':'if(lt(t,20),in_h*0.10/4*(t+2),1080-in_h*0.10/2*(t-10))',scale=1080:1920" ../o.mp4

ffmpeg -hide_banner -y -i ../i.mp4 infile.mkv -aspect 9:16 -c copy ../o_aspect.mp4

# Crop for short video (tiktok)
ffmpeg -hide_banner -y -i ../i.mp4 -vf "crop=ih*(9/16):ih" -crf 21 -c:a copy ../o_aspect_916.mp4

ffmpeg -hide_banner -y -i ../i1.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lt(t,5),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lt(t,5),in_h*0.10/3*t,1080-in_h*0.10/3*(t-5))',scale=hd1080" ../o1.mp4
ffmpeg -hide_banner -y -i ../i2.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lt(t,5),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lt(t,5),in_h*0.10/3*t,1080-in_h*0.10/3*(t-5))',scale=hd1080" ../o2.mp4
ffmpeg -hide_banner -y -i ../i3.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lt(t,5),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lt(t,5),in_h*0.10/3*t,1080-in_h*0.10/3*(t-5))',scale=hd1080" ../o3.mp4
ffmpeg -hide_banner -y -i ../i4.mp4 -vf "scale=iw*10:ih*10,crop=in_w*0.85:in_h*0.85:'if(lt(t,5),in_w*0.10/2*t,1920-in_w*0.10/2*(t-5))':'if(lt(t,5),in_h*0.10/3*t,1080-in_h*0.10/3*(t-5))',scale=hd1080" ../o4.mp4
ffmpeg -hide_banner -y -i "concat:../i1.mp4|../i2.mp4|../i3.mp4|../i4.mp4" ../o.mp4
