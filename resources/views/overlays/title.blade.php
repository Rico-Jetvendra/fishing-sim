<!DOCTYPE html>
<html lang="en">
        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="{{ asset('css/title.css') }}" />
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600;700&family=Nunito:wght@600;700&display=swap" rel="stylesheet">
        </head>
    <body>
        <div class="guild-tag">
            <div class="guild-icon">🎣</div>

            <div class="guild-info">
                <div id="streamer" class="streamer">
                    Ilithios Shurui
                </div>

                <div id="game" class="game">

                </div>
            </div>
            <div class="guild-icon">🎣</div>
        </div>

    </body>
</html>

<script src="https://cdn.socket.io/4.8.1/socket.io.min.js"></script>
<script>
    const socket = io("http://127.0.0.1:3000");
    socket.on("changeStreamInfo", changeTitle);

    function changeTitle(data){
        document.getElementById("game").textContent = data.game_name;
    }
</script>
