<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Connection Lost</title>
    <link rel="stylesheet" href="{{ asset('css/lost.css') }}" />

</head>

<body>

<div id="overlay">

    <div id="frame">

        <!-- Decorative Pins -->
        <div class="pin left"></div>
        <div class="pin right"></div>

        <!-- Gold Line -->
        <div id="top-line"></div>

        <!-- Broken Fishing Rod -->
        <div id="rod">

            <div id="broken-line">

                <div id="line"></div>

            </div>

        </div>

        <!-- Main Panel -->
        <div id="panel">

            <div id="content">

                <div id="logo">
                    🎣
                </div>

                <div id="game-title">

                    ILITHIOS SHURUI

                </div>

                <h1 id="title">

                    CONNECTION LOST

                </h1>

                <p id="subtitle">

                    The fishing line snapped!

                </p>

                <div id="description">

                    Looks like whatever was on the other end
                    was stronger than our connection.

                </div>

                <div id="divider"></div>

                <div id="status">

                    Attempting to reel the stream back in...

                </div>

                <div id="loading">

                    ● ● ●

                </div>

            </div>

        </div>

        <!-- Decorative Clouds -->

        <div class="cloud cloud1"></div>

        <div class="cloud cloud2"></div>

        <div class="cloud cloud3"></div>

    </div>

</div>

<script src="{{ asset('js/lost.js') }}"></script>

</body>
</html>
