const {Client} = require('pg');
const db = new Client({
    user: 'rafinoval72',
    host: 'ep-cold-mode-215887.ap-southeast-1.aws.neon.tech',
    database: 'InvenTracker',
    password: 'HcvUqeRQx98M',
    port: 5432,
    sslmode: 'require',
    ssl: true,
});


db.connect((err)=> {
    if(err){
        console.log(err)
        return
    }
    console.log('Database berhasil terkoneksi.')
});

module.exports = db;