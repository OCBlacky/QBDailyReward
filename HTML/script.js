
document.getElementById('closeBtn').onclick = function() {
    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST',
        body: JSON.stringify({})
    });
}


document.getElementById('claimBtn').onclick = function() {
    fetch(`https://${GetParentResourceName()}/claimReward`, {
        method: 'POST',
        body: JSON.stringify({})
    });
    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST',
        body: JSON.stringify({})
    });
}
