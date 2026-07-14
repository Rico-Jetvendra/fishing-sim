<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="{{ asset('css/overlays.css') }}" />
    </head>
    <body>
        <div class="record-bar" id="record-bar" style="{{ $heaviest ? 'display:grid;' : 'display:none' }}">
            <div class="record" id="heaviest-card">
                <div class="title">🥇 TODAY'S HEAVIEST</div>
                <div class="fish" id="heaviest-fish">{{ $heaviest->fish_name ?? ""}}</div>
                <div class="value" id="heaviest-value">{{ $heaviest->fish_weight ?? "" }} kg</div>
                <div class="user" id="heaviest-user">👤 {{ $heaviest->display_name ?? "" }}</div>
            </div>

            <div class="record" id="lightest-card">
                <div class="title">🥈 TODAY'S LIGHTEST</div>
                <div class="fish" id="lightest-fish">{{ $lightest->fish_name ?? "" }}</div>
                <div class="value" id="lightest-value">{{ $lightest->fish_weight ?? "" }} kg</div>
                <div class="user" id="lightest-user">👤 {{ $lightest->display_name ?? "" }}</div>
            </div>

            <div class="record" id="longest-card">
                <div class="title">📏 TODAY'S LONGEST</div>
                <div class="fish" id="longest-fish">{{ $longest->fish_name ?? "" }}</div>
                <div class="value" id="longest-value">{{ $longest->fish_length ?? "" }} cm</div>
                <div class="user" id="longest-user">👤 {{ $longest->display_name ?? "" }}</div>
            </div>

            <div class="record" id="shortest-card">
                <div class="title">📐 TODAY'S SHORTEST</div>
                <div class="fish" id="shortest-fish">{{ $shortest->fish_name ?? "" }}</div>
                <div class="value" id="shortest-value">{{ $shortest->fish_length ?? "" }} cm</div>
                <div class="user" id="shortest-user">👤 {{ $shortest->display_name ?? "" }}</div>
            </div>
        </div>

        <div class="empty-record" id="empty-record" style="{{ $heaviest ? 'display:none;' : 'display:grid' }}">
            <div class="empty-content">
                <div class="empty-title">
                    🎣 No Fishing Records Yet!
                </div>

                <div class="empty-text">
                    Be the first to make history!
                </div>

                <div class="command blink mt-3">
                    Type <strong>!fish</strong> in chat now!
                </div>
            </div>
        </div>
    </body>
</html>
<script src="https://cdn.socket.io/4.8.1/socket.io.min.js"></script>
<script>
    const socket = io("http://127.0.0.1:3000");

    socket.on("recordUpdated", loadRecords);

    const records = {
        heaviest: { field: "fish_weight", unit: "kg" },
        lightest: { field: "fish_weight", unit: "kg" },
        longest: { field: "fish_length", unit: "cm" },
        shortest: { field: "fish_length", unit: "cm" }
    };

    function loadRecords(data) {
        document.getElementById("empty-record").style.display = "none";
        document.getElementById("record-bar").style.display = "grid";

        for (const [type, field] of Object.entries(records)) {
            const value     = document.getElementById(`${type}-value`);
            const newValue  = `${data[type][config.field]} ${config.unit}`;

            document.getElementById(`${type}-user`).innerText  = `👤 ${data[type].display_name}`;
            document.getElementById(`${type}-fish`).innerText  = data[type].fish_name;
            document.getElementById(`${type}-value`).innerText = newValue;

            if (value.innerText !== newValue) {
                animateCard(type);
            }

            value.innerText = newValue;
        }
    }

    function animateCard(type){
        const card = document.getElementById(`${type}-card`);
        card.classList.remove("updated");

        void card.offsetWidth;

        card.classList.add("updated");
    }

</script>
