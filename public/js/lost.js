// ==========================================
// STATUS MESSAGES
// ==========================================

const statuses = [
    "Attempting to reel the stream back in...",
    "Casting another connection...",
    "Untangling the fishing line...",
    "Searching for a stronger signal...",
    "Repairing the snapped line...",
    "Following the drifting bobber...",
    "The fish is still fighting...",
    "Waiting for the line to tighten...",
    "The Guide is finding higher ground...",
    "Almost there..."
];

// ==========================================
// SUBTITLES
// ==========================================

const subtitles = [
    "The fishing line snapped!",
    "Looks like something escaped.",
    "That catch was stronger than expected.",
    "The lake won this round.",
    "The connection slipped away.",
    "Nature had other plans today."
];

// ==========================================
// ELEMENTS
// ==========================================

const status = document.getElementById("status");
const subtitle = document.getElementById("subtitle");
const loading = document.getElementById("loading");
const panel = document.getElementById("panel");
const rod = document.getElementById("rod");

// ==========================================
// RANDOM
// ==========================================

function random(array){

    return array[Math.floor(Math.random()*array.length)];

}

// ==========================================
// STATUS
// ==========================================

function rotateStatus(){

    status.style.opacity = 0;

    setTimeout(()=>{

        status.innerHTML = random(statuses);

        status.style.opacity = 1;

    },300);

}

setInterval(rotateStatus,7000);

// ==========================================
// SUBTITLE
// ==========================================

function rotateSubtitle(){

    subtitle.style.opacity = 0;

    setTimeout(()=>{

        subtitle.innerHTML = random(subtitles);

        subtitle.style.opacity = 1;

    },300);

}

setInterval(rotateSubtitle,10000);

// ==========================================
// LOADING DOTS
// ==========================================

let dots = 0;

setInterval(()=>{

    dots++;

    if(dots > 3){

        dots = 1;

    }

    loading.innerHTML = ".".repeat(dots);

},500);

// ==========================================
// LIGHTNING
// ==========================================

function lightning(){

    const flash = document.createElement("div");

    flash.className = "lightning";

    panel.appendChild(flash);

    setTimeout(()=>{

        flash.remove();

    },450);

}

function randomLightning(){

    lightning();

    const next = 15000 + Math.random() * 15000;

    setTimeout(randomLightning,next);

}

randomLightning();

// ==========================================
// ROD TUG
// ==========================================

function tug(){

    rod.animate([

        {

            transform:"rotate(8deg)"

        },

        {

            transform:"rotate(13deg)"

        },

        {

            transform:"rotate(7deg)"

        },

        {

            transform:"rotate(8deg)"

        }

    ],{

        duration:700,

        easing:"ease-out"

    });

}

setInterval(()=>{

    if(Math.random() < 0.4){

        tug();

    }

},12000);

// ==========================================
// RECONNECT ATTEMPTS
// ==========================================

let attempt = 1;

setInterval(()=>{

    if(attempt > 99){

        attempt = 1;

    }

    console.log(
        "Reconnect attempt #" + attempt
    );

    attempt++;

},8000);

// ==========================================
// TITLE SHIMMER
// ==========================================

const title = document.getElementById("title");

setInterval(()=>{

    title.animate([

        {

            letterSpacing:"4px"

        },

        {

            letterSpacing:"8px"

        },

        {

            letterSpacing:"4px"

        }

    ],{

        duration:1200

    });

},12000);

// ==========================================
// INITIALIZE
// ==========================================

status.innerHTML = random(statuses);
subtitle.innerHTML = random(subtitles);
