const fs = require('fs')
const path = require('path')

const image = path.join(__dirname, '../octopus.png')
const file = fs.readFileSync(image, {encoding:'utf8'})
