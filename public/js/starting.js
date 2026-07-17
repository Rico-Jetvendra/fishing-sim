// ======================================
// CONFIGURATION
// ======================================

const statuses = [
    "Preparing bait...",
    "Untangling fishing line...",
    "Checking today's weather...",
    "Sharpening fishing hooks...",
    "Guide is getting ready...",
    "Waiting for fishermen...",
    "Almost time..."
];

const lore = [
    "The rivers of Seran are home to a lot species of fish.",
    "People from Rosegleam will pay a lot for some fishes.",
    "The waters of Tidehaven hide creatures larger than ships.",
    "Not every treasure found underwater is made of gold.",
    "Some fish appear more during heavy rain.",
    "Endral's greatest anglers are remembered in the Guild Hall.",
    "Even the smallest fish has a story."
];

// ======================================
// ELEMENTS
// ======================================

const statusElement = document.getElementById("status");
const loreElement = document.getElementById("subtitle");

// ======================================
// STATUS ROTATION
// ======================================

let statusIndex = 0;

function rotateStatus(){

    if(!statusElement) return;

    statusElement.style.opacity = 0;

    setTimeout(()=>{

        statusIndex++;

        if(statusIndex >= statuses.length){

            statusIndex = 0;

        }

        statusElement.textContent = statuses[statusIndex];

        statusElement.style.opacity = 1;

    },300);

}

setInterval(rotateStatus,5000);

// ======================================
// LORE ROTATION
// ======================================

let loreIndex = 0;

function rotateLore(){

    if(!loreElement) return;

    loreElement.style.opacity = 0;

    setTimeout(()=>{

        loreIndex++;

        if(loreIndex >= lore.length){

            loreIndex = 0;

        }

        loreElement.textContent = lore[loreIndex];

        loreElement.style.opacity = 1;

    },300);

}

setInterval(rotateLore,10000);

// ======================================
// SMOOTH TRANSITIONS
// ======================================

statusElement.style.transition = "opacity .3s";
loreElement.style.transition = "opacity .3s";

// ======================================
// RANDOM TITLE GLOW
// ======================================

const title = document.querySelector("h1");

function shimmer(){

    title.style.filter = "brightness(1.2)";

    setTimeout(()=>{

        title.style.filter = "brightness(1)";

    },800);

}

setInterval(shimmer,15000);

// ======================================
// RANDOM STATUS ON LOAD
// ======================================

statusElement.textContent =
    statuses[Math.floor(Math.random() * statuses.length)];

loreElement.textContent =
    lore[Math.floor(Math.random() * lore.length)];
