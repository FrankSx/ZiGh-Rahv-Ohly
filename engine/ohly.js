
function linkingNumber(braid){

    let count = 0

    braid.split(" ").forEach(g=>{
        if(g.includes("^-1")) count--
        else count++
    })

    return count
}

function Ohly(braid){

    return {
        linking: linkingNumber(braid)
    }
}

module.exports = Ohly
