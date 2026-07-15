<!DOCTYPE html>
<html>
    <head>
        <title>Endral | Chat</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="{{ asset('css/overlays.css') }}" />
    </head>
    <body>
        <div class="chat-box-header"><i class="bi bi-chat-square-text-fill"></i><span class="blink">CHAT BOX</span></div>
        <div id="chat-container">
        </div>
    </body>
</html>
<script src="https://cdn.socket.io/4.8.1/socket.io.min.js"></script>
<script>
    const bannedWords = @json($bannedWords);
    const socket      = io("http://127.0.0.1:3000");
    const platformIcons = {
        twitch: '<i class="bi bi-twitch"></i>',
        youtube: '<i class="bi bi-youtube"></i>'
    };

    socket.on("chatMessage", chat);

    function chat(data){
        const container     = document.getElementById("chat-container");
        const message       = document.createElement("div");

        const mod           = data.tags['mod'] ? '<i class="bi bi-shield-fill"></i>': '';
        const subscriber    = data.tags['subscriber'] ? '<i class="bi bi-star-fill"></i>': '';

        const chatBox       = data.command ? "command-box": "chat-box";
        const chatHeader    = data.command ? "command-header": "chat-header";
        const chatMessage   = data.command ? "command-message": "chat-message";
        const username      = data.command ? "OfficialEndral" : data.tags['display-name'];
        const icon          = data.command ? "🎣" : platformIcons[data.platform];

        message.className = chatBox;
        message.innerHTML = `
            <div class="${chatHeader}">
                <span class="platform">${icon}</span>
                <span class="username" style="color:${data.tags.color || '#ffffff'}">
                    ${username}
                </span>
                <span class="badge">
                    ${mod} ${subscriber}
                </span>
            </div>

            <div class="${chatMessage}">
                ${escapeHtml(data.message)}
            </div>
        `;

        container.prepend(message);

        // Keep only the latest 7 messages
        while (container.children.length > 5) {
            container.lastElementChild.remove();
        }
    }

    function escapeHtml(text) {
        const div       = document.createElement("div");
        div.innerText   = censor(text);

        return div.innerHTML;
    }

    function censor(text){
        for(const word of bannedWords){
            const regex = buildRegex(word);

            text = text.replace(regex, match => maskWord(match));
        }

        return text;
    }

    function buildRegex(word){
        return new RegExp(
            word
                .split('')
                .map(c => `${c}+`)
                .join(''),
            'gi'
        );
    }

    function maskWord(word) {
        if (word.length <= 2) {
            return "*".repeat(word.length);
        }

        return (
            word[0] +
            "*".repeat(word.length - 2) +
            word[word.length - 1]
        );

    }
</script>
