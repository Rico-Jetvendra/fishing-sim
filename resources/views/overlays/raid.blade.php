<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="{{ asset('css/raid.css') }}" />
    </head>
    <body>
        <div class="ship">
            <svg
                viewBox="0 0 800 600"
                xmlns="http://www.w3.org/2000/svg">

                <!-- Shadow -->
                <ellipse
                    class="shadow"
                    cx="400"
                    cy="500"
                    rx="170"
                    ry="20"/>

                <!-- Hull -->
                <path
                    class="hull"
                    d="
                        M180 420
                        C220 390 580 390 620 420
                        L590 490
                        L220 490
                        Z
                    "/>

                <!-- Deck -->
                <rect
                    class="deck"
                    x="230"
                    y="385"
                    width="340"
                    height="25"
                    rx="6"/>

                <!-- Cabin -->
                <rect
                    class="cabin"
                    x="430"
                    y="325"
                    width="90"
                    height="60"
                    rx="5"/>

                <!-- Roof -->
                <rect
                    class="roof"
                    x="420"
                    y="315"
                    width="110"
                    height="12"
                    rx="4"/>

                <!-- Windows -->
                <circle class="window" cx="455" cy="355" r="8"/>
                <circle class="window" cx="495" cy="355" r="8"/>

                <!-- Main Mast -->
                <rect
                    class="mast"
                    x="388"
                    y="110"
                    width="10"
                    height="275"/>

                <!-- Front Mast -->
                <rect
                    class="mast"
                    x="285"
                    y="170"
                    width="8"
                    height="215"/>

                <!-- Main Sail -->
                <path
                    class="sail main"
                    d="
                        M398 125
                        L565 250
                        L398 375
                        Z
                    "/>

                <!-- Front Sail -->
                <path
                    class="sail front"
                    d="
                        M293 185
                        L170 285
                        L293 365
                        Z
                    "/>

                <!-- Flag -->
                <path
                    class="flag"
                    d="
                        M398 120
                        L445 132
                        L425 150
                        L445 168
                        L398 178
                        Z
                    "/>

                <!-- Bowsprit -->
                <line
                    class="bowsprit"
                    x1="620"
                    y1="420"
                    x2="700"
                    y2="390"/>

                <!-- Ropes -->
                <line class="rope" x1="393" y1="125" x2="565" y2="250"/>
                <line class="rope" x1="393" y1="125" x2="398" y2="375"/>

                <line class="rope" x1="289" y1="185" x2="170" y2="285"/>
                <line class="rope" x1="289" y1="185" x2="293" y2="365"/>

            </svg>
        </div>
    </body>
</html>

<script src="https://cdn.socket.io/4.8.1/socket.io.min.js"></script>
<script src="{{ asset('js/raid.js') }}"></script>
