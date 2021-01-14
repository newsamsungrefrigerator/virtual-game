ffmpeg \
  -ss 17 -i ftc16031-league1-game1.mp4 \
  -ss 1 -i ftc16031-league1-game5.mp4 \
  -ss 5 -i ftc16031-league1-game3.mp4 \
  -ss 6 -i ftc16031-league1-game6.mp4 \
  -filter_complex "[0:v][1:v]hstack[t];[2:v][3:v]hstack[b];[t][b]vstack[v];\
  [0:a][1:a]amerge[a];\
  [v]drawtext=fontfile=OpenSans-Italic.ttf:text='Team Parabellum':fontcolor=white:fontsize=24:box=1: boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2[v]" \
  -map "[v]" -map "[a]" -f matroska - |ffplay -
