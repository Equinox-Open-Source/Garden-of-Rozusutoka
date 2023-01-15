const Express = require('express');
const Chalk = require('chalk');
const Path = require('node:path');

//-- 

const PORT = 3000;
const HOST = `http://107.196.32.234`;
const ALLOWED_PATH = './pages';

const app = Express();

app.get('/',(req,res) => {

    res.sendFile(Path.join(__dirname,ALLOWED_PATH)+'\\home.html')

});

app.listen(PORT, () => {

    console.log(Chalk.greenBright(`Listening to connections on ${HOST}:${PORT}`));

});