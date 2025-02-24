import { knex } from "knex"

export class BaseDatabase{
    //public connection = knex({
    protected static connection = knex ({
        client: "sqlite3",
        connection: {
            filename: "./src/database/labook.db",
        },
        useNullAsDefault: true,
        pool: { 
            min: 0,
            max: 1,
            afterCreate: (conn: any, cb: any) => {
                conn.run("PRAGMA foreign_keys = ON", cb)
            }
        }
    })
}

