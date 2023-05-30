const res = require('express/lib/response');
const { use } = require('passport/lib');
const db = require('../configs/db.config');
const helper = require('../utils/helper');
const { describe } = require('node:test');
const { group } = require('console');

async function login (it){
    const {name, password} = it;
    const query = `SELECT * FROM users WHERE name = '${name}'`;
    const result = await db.query(query);
    if(result.rows.length === 0){
        return {
            message: 'User not found'
        }
    }else{
        const user = result.rows[0];
        if(user.password === password){
            return {
                message: 'Login successful',
                user
            }
        }else{
            return {
                message: 'Password is not correct'
            }
        }
    }
}

async function register (it){
    const {name, password, email, role} = it;
    const pass = await helper.hashPassword(password);
    const query = `INSERT INTO users (name, password, email, role) VALUES ('${name}', '${pass}', '${email}', '${role}')`;
    const result = await db.query(query);
    if(result.rowCount === 1){
        return {
            message: 'User Created'
        }
    }else{
        return{
            message: 'Error'
        } 
    }
}

async function showUser (user){
    if(user){
        const query = `SELECT * FROM users WHERE UserID=${user.userID}`;
        const result = await db.query(query);
        if(result.rowCount === 1){
            return {
                message: 'User found',
                user : result.rows
            }
        }else{
            return {
                message: 'User not found'
            }
        }
    }else{
        return {
            message: 'User not found!'
        }
    }
}

async function deleteUser (user){
    if(user){
        const query = `DELETE FROM users WHERE UserID=${user.UserID}`;
        const result = await db.query(query);
        if(result.rowCount === 1){
            return {
                message: 'User deleted'
            }
        }
        else{
            return {
                message: 'User not found'
            }
        }
    }
    else{
        return {
            message: 'USer not logged in'
        }
    }
}

async function addItem (it){
    const {Name, Quantity, Category, LocationID, DateAdded} = it;
    const query = `INSERT INTO items (Name, Quantity, Category, LocationID) VALUES ('${Name}', '${Quantity}', '${Category}', '${LocationID}')`;
    const result = await db.query(query);
    if(result.rowCount === 1){
        return {
            message: 'Item Created'
        }
    }else{
        return{
            message: 'Error'
        } 
    }
}

async function showItem (){
    const query = `SELECT * FROM items`;
    const result = await db.query(query);
    if(result.rowCount){
        return {
            message: 'Items found',
            showItem : result.rows
        }
    }else{
        return {
            message: 'no Items found'
        }
    }
}

async function searchItemByName (it){
    const {Name} = it;
    const query = `SELECT * FROM items WHERE name='${Name}'`;
    const result = await db.query(query);
    if(result.rowCount){
        return {
            message: 'Item found',
            searchItemByName : result.rows
        }
    }else{
        return {
            message: 'Item not found'
        }
    }
}

async function updateItem(it){
    const {ItemID, Name, Quantity, Category} = it;
    const query = `UPDATE items SET name='${Name}', Quantity='${Quantity}', Category='${Category}' WHERE ItemID=${ItemID}`;
    const result = await db.query(query);
    if(result.rowCount > 0){
        return {
            message: 'Item Updated'
        }
    }else{
        return{
            message: 'No Item Updated'
        } 
    }  
}

async function deleteItem(it){
    const {ItemID} = it;
    const query = `DELETE FROM items WHERE ItemID=${ItemID}`;
    const result = await db.query(query);
    if(result.rowCount > 0){
        return {
            message: 'Item deleted'
        }
    }
    else{
        return {
            message: 'Item not found'
        }
    }
}

async function addLocation (it){
    const {Name, Description, Address} = it;
    const query = `INSERT INTO Location (Name, Description, Address) VALUES ('${Name}', '${Description}', '${Address}')`;
    const result = await db.query(query);
    if(result.rowCount === 1){
        return {
            message: 'Location Created'
        }
    }else{
        return{
            message: 'Error'
        } 
    }
}

async function showLocation (){
    const query = `SELECT * FROM location`;
    const result = await db.query(query);
    if(result.rowCount){
        return {
            message: 'Locations found',
            showLocation : result.rows
        }
    }else{
        return {
            message: 'no Location found'
        }
    }
}
    
async function updateLocation(it){
    const {LocationID, Name, Description, Address} = it;
    const query = `UPDATE location SET name='${Name}', description='${Description}', address='${Address}' WHERE locationID=${LocationID}`;
    const result = await db.query(query);
    if(result.rowCount > 0){
        return {
            message: 'Location Updated'
        }
    }else{
        return{
            message: 'No location Updated'
        } 
    }  
}

async function moveItem(it){
    const{ItemID, UserID, LocationID, Note} = it;
    const query1 = `INSERT INTO movement (ItemID, UserID, LocationID, Note) VALUES (${ItemID}, ${UserID}, ${LocationID}, '${Note}')`;
    const result1 = await db.query(query1);
    console.log(result1.rowCount);
    if(result1.rowCount === 1){
        const query2 = `UPDATE items SET locationid=${LocationID} WHERE itemid=${ItemID}`;
        const result2 = await db.query(query2);
        console.log(result2.rowCount);
        if(result2.rowCount > 0){
            return {
                message: 'Item Updated'
            }
        }else{
            return{
                message: 'Error'
            }
        }
    }else{
        return{
            message: 'Error! Item or User or Location not Found'
        }
    }
}

async function showMovement(){
    const query = `SELECT * FROM movement`;
    const result = await db.query(query);
    if(result.rowCount > 0){
        return{
            message: 'Movement Found',
            showMovement: result.rows
        }
    }else{
        return{
            message: 'No movement found'
        }
    }
}

module.exports = {
    login,
    register,
    showUser,
    deleteUser,
    addItem,
    showItem,
    searchItemByName,
    updateItem,
    deleteItem,
    addLocation,
    showLocation,
    updateLocation,
    moveItem,
    showMovement
}