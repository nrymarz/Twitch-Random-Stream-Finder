const streamPlayer = document.querySelector("iframe")
const configObj = {
    headers: {
        'Authorization': `Bearer `
    }
}
fetch("https://api.twitch.tv/helix/search/channels")