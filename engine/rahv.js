
function Rahv(braid){

    // apply braid relation simplifications

    let changed = true

    while(changed){
        changed = false

        braid = braid.replace(/σ1 σ2 σ1/g,"σ2 σ1 σ2")
    }

    return braid
}

module.exports = Rahv
