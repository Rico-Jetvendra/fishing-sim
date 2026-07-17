
const socket  = io("http://127.0.0.1:3000");

const license    = document.getElementById("license");
const playerName = document.getElementById("player-name");
const playerRank = document.getElementById("player-rank");
const guildId    = document.getElementById("guild-id");

const queue = [];

let showing = false;
let timeout = null;

socket.on("notice", (data) => {
    queue.push(data);
    if (!showing){
        showNext();
    }
});

function showNext(){
    if(queue.length === 0){
        showing = false;
        return;
    }

    showing = true;
    const data = queue.shift();
    showLicense(data);
}

function showLicense(data){
    playerName.textContent = data.event.user_name ?? "Unknown";
    playerRank.textContent = "Beginner";
    guildId.textContent = formatToDDMMYYYY(data.event.followed_at) ?? formatToDDMMYYYY(new Date());

    license.classList.remove("show");
    license.classList.remove("hide");

    // Restart animation
    void license.offsetWidth;

    license.classList.add("show");

    clearTimeout(timeout);

    timeout = setTimeout(() => {
        hideLicense();
    }, 6000);
}

function hideLicense(){
    license.classList.remove("show");
    license.classList.add("hide");

    setTimeout(() => {
        showNext();
    }, 900);
}

function formatToDDMMYYYY(dt) {
  const date = new Date(dt);

  const day = String(date.getDate()).padStart(2, '0');
  const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-indexed
  const year = date.getFullYear();

  return `${day}/${month}/${year}`;
}
