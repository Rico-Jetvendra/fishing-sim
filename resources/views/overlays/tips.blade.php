<!DOCTYPE html>
<html>
    <head>
        <title>Endral | Tips</title>
        <link rel="stylesheet" href="{{ asset('css/overlays.css') }}" />
    </head>
    <body>
        <span class="tip-bar" id="tips">🎣 Type !fish to start fishing!</span>
    </body>
</html>
<script>
    const tips = [
        "🎣 Type !fish to start fishing!",
        "🏆 Records are reset every day!",
        "🐟 Bigger fish require better rods!",
        "✨ Different bait attracts different fish!",
        "🌦 Weather affects what you'll catch!"
    ];

    let currentTip = 0;

    setInterval(() => {
        document.getElementById("tips").textContent = tips[currentTip];
        currentTip = (currentTip + 1) % tips.length;
    }, 8000);

</script>
