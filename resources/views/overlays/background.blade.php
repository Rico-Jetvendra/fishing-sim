<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fishing Overlay</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="{{ asset('css/background.css') }}" />
    </head>
    <body>
        <div class="overlay">
            <div class="frame">
                <header class="top-bar">
                    <div class="title-bar">
                        <div class="title-line"></div>
                    </div>
                </header>

                <main class="main-layout">
                    <section class="left-panel">
                        <div class="game-frame">
                            <div class="frame-top"></div>
                            <div class="frame-left"></div>
                            <div class="frame-right"></div>
                            <div class="frame-bottom"></div>
                            <div class="game-screen"></div>
                        </div>

                        <footer class="records" id="record-bar" style="{{ $heaviest ? 'display:flex;' : 'display:none' }}">
                            <article class="record-card">
                                <span class="rivet tl"></span>
                                <span class="rivet tr"></span>
                                <span class="rivet bl"></span>
                                <span class="rivet br"></span>
                                <div class="record-content">
                                    <div class="record-title">🥇 HEAVIEST</div>
                                    <div class="record-fish" id="heaviest-fish">{{ $heaviest->fish_name ?? ""}}</div>
                                    <div class="record-value" id="heaviest-value">{{ $heaviest->fish_weight ?? "" }} kg</div>
                                    <div class="record-user" id="heaviest-user">👤 {{ $heaviest->display_name ?? "" }}</div>
                                </div>
                            </article>
                            <article class="record-card">
                                <span class="rivet tl"></span>
                                <span class="rivet tr"></span>
                                <span class="rivet bl"></span>
                                <span class="rivet br"></span>
                                <div class="record-content">
                                    <div class="record-title">🥈 LIGHTEST</div>
                                    <div class="record-fish" id="lightest-fish">{{ $lightest->fish_name ?? "" }}</div>
                                    <div class="record-value" id="lightest-value">{{ $lightest->fish_weight ?? "" }} kg</div>
                                    <div class="record-user" id="lightest-user">👤 {{ $lightest->display_name ?? "" }}</div>
                                </div>
                            </article>
                            <article class="record-card">
                                <span class="rivet tl"></span>
                                <span class="rivet tr"></span>
                                <span class="rivet bl"></span>
                                <span class="rivet br"></span>
                                <div class="record-content">
                                    <div class="record-title">📏 LONGEST</div>
                                    <div class="record-fish" id="longest-fish">{{ $longest->fish_name ?? "" }}</div>
                                    <div class="record-value" id="longest-value">{{ $longest->fish_length ?? "" }} cm</div>
                                    <div class="record-user" id="longest-user">👤 {{ $longest->display_name ?? "" }}</div>
                                </div>
                            </article>
                            <article class="record-card">
                                <span class="rivet tl"></span>
                                <span class="rivet tr"></span>
                                <span class="rivet bl"></span>
                                <span class="rivet br"></span>
                                <div class="record-content">
                                    <div class="record-title">📐 SHORTEST</div>
                                    <div class="record-fish" id="shortest-fish">{{ $shortest->fish_name ?? "" }}</div>
                                    <div class="record-value" id="shortest-value">{{ $shortest->fish_length ?? "" }} cm</div>
                                    <div class="record-user" id="shortest-user">👤 {{ $shortest->display_name ?? "" }}</div>
                                </div>
                            </article>
                        </footer>

                        <footer class="empty-record" id="empty-record" style="{{ $heaviest ? 'display:none;' : 'display:flex;' }}">
                            <div class="empty-content">
                                <div class="empty-icon">🏆</div>
                                <div class="empty-title">No Fishing Records Yet</div>
                                <div class="empty-text">Be the first to make history today.</div>
                                <div class="command mt-3">Type <strong class="blink">!fish</strong> in chat to begin your adventure.</div>
                            </div>
                        </footer>
                    </section>

                    <aside class="right-panel">
                        <section class="tips-frame">
                            <div class="panel-header">Tips</div>
                            <div class="tips-body" id="tips">
                                <div class="tip-icon">🎣</div>
                                <div class="tip-text">
                                    Type <span class="tip-command blink">!fish</span><br>
                                    to start fishing
                                </div>
                            </div>
                        </section>

                        <section class="chat-frame">
                            <div class="panel-header">Chat Log</div>
                            <div class="chat-body"></div>
                        </section>

                        <section class="avatar-frame">
                            <div class="panel-header">Guide</div>
                            <div class="avatar-body"></div>
                        </section>
                    </aside>
                </main>

            </div>
        </div>
    </body>
</html>

<script src="https://cdn.socket.io/4.8.1/socket.io.min.js"></script>
<script>
    const tips = [
        {
            icon: "🎣",
            text: "Type <span class='tip-command blink'>!fish</span><br> to start fishing!"
        },
        {
            icon: "🏆",
            text: "Records are reset every day!"
        },
        {
            icon: "🐟",
            text: "Bigger fish require better rods!"
        },
        {
            icon: "✨",
            text: "Different bait attracts different fish!"
        },
        {
            icon: "🌦️",
            text: "Weather affects what you'll catch!"
        }
    ];

    let currentTip = 0;

    function updateTip() {
        const tip = tips[currentTip];

        document.getElementById("tips").innerHTML = `
            <div class="tip-icon">${tip.icon}</div>
            <div class="tip-text">${tip.text}</div>
        `;

        currentTip = (currentTip + 1) % tips.length;
    }

    updateTip();
    setInterval(updateTip, 8000);

    const socket  = io("http://127.0.0.1:3000");
    const records = {
        heaviest: { field: "fish_weight", unit: "kg", icon: "🥇" },
        lightest: { field: "fish_weight", unit: "kg", icon:"🥈" },
        longest: { field: "fish_length", unit: "cm", icon:"📏" },
        shortest: { field: "fish_length", unit: "cm", icon:"📐" }
    };

    socket.on("recordUpdated", loadRecords);

    function loadRecords(data) {
        document.getElementById("empty-record").style.display = "none";
        document.getElementById("record-bar").style.display = "flex";

        const recordBar = document.getElementById('record-bar');

        recordBar.innerHTML = "";
        for (const [type, field] of Object.entries(records)) {
            const recordCard = document.createElement("article");
            const newValue   = `${data[type][field.field]} ${field.unit}`;

            recordCard.className = "record-card";
            recordCard.innerHTML = `
                <span class="rivet tl"></span>
                <span class="rivet tr"></span>
                <span class="rivet bl"></span>
                <span class="rivet br"></span>
                <div class="record-content">
                    <div class="record-title">${field.icon} ${type.toUpperCase()}</div>
                    <div class="record-fish" id="${type}-fish">${data[type].fish_name}</div>
                    <div class="record-value" id="${type}-value">${newValue}</div>
                    <div class="record-user" id="${type}-user">👤 ${data[type].display_name}</div>
                </div>
            `;

            animateCard();
            recordBar.append(recordCard);
        }
    }

    function animateCard(){
        const cards = document.getElementsByClassName(`record-card`);

        for (const card of cards) {
            card.classList.remove("updated");
            void card.offsetWidth;
            card.classList.add("updated");
        }
    }
</script>
