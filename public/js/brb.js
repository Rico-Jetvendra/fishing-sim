// ==========================================
// STATUS MESSAGES
// ==========================================

const statuses = [
    "Refilling the bait bucket...",
    "Untangling the fishing line...",
    "Checking today's catch...",
    "Buying fresh bait...",
    "Talking with the harbor merchant...",
    "Repairing the fishing rod...",
    "Cleaning the tackle box...",
    "Taking a short break...",
    "Making some tea...",
    "Watching the water for rare fish..."
];


// ==========================================
// FISHING QUOTES
// ==========================================

const quotes = [

    "Patience catches the biggest fish.",
    "Every cast is another adventure.",
    "Even legends wait for a bite.",
    "The lake remembers every fisherman.",
    "Some treasures only appear to the patient.",
    "A calm lake hides many secrets.",
    "Luck favors those who keep casting.",
    "Today's trophy could be the next cast."

];


// ==========================================
// ELEMENTS
// ==========================================

const status = document.getElementById("status");

const subtitle = document.getElementById("subtitle");

const panel = document.getElementById("center-panel");

const water = document.getElementById("water");


// ==========================================
// RANDOM HELPERS
// ==========================================

function random(array){

    return array[Math.floor(Math.random() * array.length)];

}


// ==========================================
// STATUS ROTATION
// ==========================================

function rotateStatus(){

    status.style.opacity = 0;

    setTimeout(()=>{

        status.innerHTML = random(statuses);

        status.style.opacity = 1;

    },400);

}

setInterval(rotateStatus,8000);


// ==========================================
// QUOTE ROTATION
// ==========================================

function rotateQuote(){

    subtitle.style.opacity = 0;

    setTimeout(()=>{

        subtitle.innerHTML = random(quotes);

        subtitle.style.opacity = 1;

    },400);

}

setInterval(rotateQuote,12000);


// ==========================================
// TIME OF DAY
// ==========================================

function updateSky(){

    const hour = new Date().getHours();

    if(hour >= 6 && hour < 11){

        panel.style.background =
            "linear-gradient(#7ba6cb,#97bdd8,#5f8fa8,#2b5d72)";

    }

    else if(hour >= 11 && hour < 17){

        panel.style.background =
            "linear-gradient(#69b7f0,#92d0ff,#5ca7d8,#2b6d93)";

    }

    else if(hour >= 17 && hour < 19){

        panel.style.background =
            "linear-gradient(#f5b56d,#d88d63,#7f6288,#2f4c74)";

    }

    else{

        panel.style.background =
            "linear-gradient(#081424,#10233f,#163757,#214b6a)";

    }

}

updateSky();

setInterval(updateSky,300000);


// ==========================================
// WATER RIPPLE
// ==========================================

function ripple(){

    const wave = document.createElement("div");

    wave.className = "ripple";

    wave.style.left = Math.random() * 90 + "%";

    wave.style.bottom = 80 + Math.random() * 140 + "px";

    water.appendChild(wave);

    setTimeout(()=>{

        wave.remove();

    },3500);

}

setInterval(ripple,5000 + Math.random() * 5000);


// ==========================================
// RANDOM FISH SPLASH
// ==========================================

function splash(){

    const splash = document.createElement("div");

    splash.className = "splash";

    splash.innerHTML = "💦";

    splash.style.left = Math.random() * 80 + 10 + "%";

    splash.style.bottom = 140 + Math.random() * 100 + "px";

    water.appendChild(splash);

    setTimeout(()=>{

        splash.remove();

    },2000);

}

setInterval(()=>{

    if(Math.random() < 0.35){

        splash();

    }

},9000);


// ==========================================
// TITLE SHIMMER
// ==========================================

const title = document.getElementById("brb");

setInterval(()=>{

    title.animate([

        {

            letterSpacing:"5px"

        },

        {

            letterSpacing:"8px"

        },

        {

            letterSpacing:"5px"

        }

    ],{

        duration:1200

    });

},10000);


// ==========================================
// INITIALIZE
// ==========================================

status.innerHTML = random(statuses);

subtitle.innerHTML = random(quotes);
