<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fishing Overlay</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="{{ asset('css/follow.css') }}" />
    </head>
    <body>
        <div id="license">

            <div class="rope"></div>

            <div class="hole"></div>

            <div class="tag">

                <div class="metal left"></div>
                <div class="metal right"></div>

                <div class="guild-icon">🎣</div>

                <div class="divider"></div>

                <div class="rank-stars">
                    A new fishermen has arrived!
                </div>

                <div class="content">

                    <div class="label">Name</div>
                    <div class="value" id="player-name"></div>

                    <div class="label">Rank</div>
                    <div class="value" id="player-rank"></div>

                    <div class="label">Joined At</div>
                    <div class="value" id="guild-id"></div>

                </div>

            </div>

        </div>
    </body>
</html>

<script src="https://cdn.socket.io/4.8.1/socket.io.min.js"></script>
<script src="{{ asset('js/follow.js') }}"></script>
