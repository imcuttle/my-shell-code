/**
 * Created by moyu on 2017/7/15.
 */
const nps = require('path')
const fs = require('fs')
const readline = require('readline')

const allDataPath = nps.join(__dirname, 'all.csv')
const partDataPath = nps.join(__dirname, 'part.csv')
const outPath = nps.join(__dirname, 'out.csv')


let rl = readline.createInterface({
    input: fs.createReadStream(allDataPath),
});


const nameMap = {}
let n = 0
rl.on('line', line => {
    n++
    const arr = line.split(',')
    const name = arr[7]
    nameMap[name] = n
})


rl.on('close', () => {

    rl = readline.createInterface({
        input: fs.createReadStream(partDataPath),
    });
    n = 0
    let num = 0
    rl.on('line', line => {
        n++
        const arr = line.split(',')
        const name = arr[4]
        if (nameMap[name]) {
            num++;
            console.log(`部分数据第${n}行对应全部数据第${nameMap[name]}行`/*, line*/)
        }
    })
    rl.on('close', () => {
        console.log(`总共有${num}条数据对应`)
    })
})
