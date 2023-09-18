ffmpeg -hide_banner -y -i "../i.mp4" -filter_complex "[0:v]selectivecolor=correction_method=absolute:reds='1 0 0 0'[v]" -map '[v]' -an "../o.mp4"

ffmpeg -hide_banner -y -i "../i.mp4" -vf "selectivecolor=greens=.5 0 -.33 0:blues=0 .27" "../o.mp4"

ffmpeg -hide_banner -y -i "../i.mp4" -vf "selectivecolor=reds=0 -0.20 -0.20 0:yellows=0 0 -0.20 0.10:cyans=-0.66 -0.50 0.20 0.75:blues=0 0 -0.50 0.15" "../o.mp4"

Use a Photoshop selective color preset:
ffmpeg -hide_banner -y -i "../i.mp4" -vf "selectivecolor=psfile=../selectivecolor.asv" "../o.mp4"


Alien 1979:
-vf selectivecolor=reds=0 -0.20 -0.20 0:yellows=0 0 -0.20 0.10:cyans=-0.66 -0.50 0.20 0.75:blues=0 0 -0.50 0.15

Aliens:
-vf selectivecolor=cyans=-0.33 0.45 0.33 -0.15

Alien3:
-vf selectivecolor=reds=0 -0.15 -0.15 0:yellows=0 0 -0.20 0.10:cyans=-0.33 0.25 0.33 -0.15

DC Extended Universe:
-vf selectivecolor=reds=0 -0.15 -0.15 0:yellows=0 0 -0.2 0.1:cyans=-0.33 0.33 0.33 -0.20

Harry Potter series:
-vf selectivecolor=cyans=-0.33 0.33 0.66 -0.2:greens=0.15 0.15 -0.15 0

Lord of the Rings and The Hobbit:
-vf selectivecolor==reds=0 -0.15 -0.15 0.15:yellows=0 0 -0.2 0:greens=-0.25 0.25 0 -0.15:cyans=0 0.50 0.50 -0.33

Mavel Cinematic Universe (CMU):
-vf selectivecolor=reds=0 -0.2 -0.2 0.1:yellows=0 0 -0.2 0.05:cyans=-0.50 0.50 0.50 -0.30

Transformers:
-vf selectivecolor=reds=0 -0.1 -0.1 0.1:yellows=0 0 -0.1 0.05:cyans=0 0.1 0.1 -0.05