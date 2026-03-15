
const fs = require('fs')

function parseSVG(svg) {
    const paths = [...svg.matchAll(/<path[^>]*d="([^"]+)"/g)]
    return paths.map(p => p[1])
}

function samplePath(path) {
    // extremely simplified path sampling
    const coords = path.match(/-?\d+\.?\d*/g).map(Number)
    let points = []
    for (let i=0;i<coords.length;i+=2){
        points.push({x:coords[i], y:coords[i+1]})
    }
    return points
}

function detectCrossings(paths){
    let braid = []
    for(let i=0;i<paths.length;i++){
        for(let j=i+1;j<paths.length;j++){
            let a = paths[i][0]
            let b = paths[j][0]

            if(a.x < b.x){
                braid.push(`σ${i+1}`)
            } else {
                braid.push(`σ${i+1}^-1`)
            }
        }
    }
    return braid
}

function ZiGh(svgFile){
    const svg = fs.readFileSync(svgFile,'utf8')
    const paths = parseSVG(svg).map(samplePath)
    const braid = detectCrossings(paths)
    return braid.join(' ')
}

if(require.main === module){
    const file = process.argv[2]
    const result = ZiGh(file)
    console.log(result)
}

module.exports = ZiGh
