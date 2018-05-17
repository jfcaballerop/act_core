var dbparam = 'sga_core',
    user = 'sga_user',
    pass = 'sga_user',
    port = 27017;

var conn = new Mongo('127.0.0.1:' + port);
var db = conn.getDB(dbparam);
db = connect("localhost:" + port + "/" + dbparam);
db.createUser({
    user: user,
    pwd: pass,
    roles: [{
            role: "readWrite",
            db: dbparam
        },
        {
            role: "dbOwner",
            db: dbparam
        }
    ]
});

db.createCollection('pruebaBuild');