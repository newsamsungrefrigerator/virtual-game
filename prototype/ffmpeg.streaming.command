# mimic streaming as play an existing file
ffmpeg -i ~/tmp/FTC/League2/ftc16031-league2-game3.MP4 -f flv "rtmp://127.0.0.1:5555"


# run ffmpeg as a rtmp server and combine two stream into one
ffmpeg -listen 1 -i rtmp://127.0.0.1:5555 \
    -listen 2 -i rtmp://127.0.0.1:5556 \
    -filter_complex "[0:v][1:v]hstack[v];[0:a][1:a]amerge[a]" -map "[v]" -map "[a]" \
    -f matroska - |ffplay -
