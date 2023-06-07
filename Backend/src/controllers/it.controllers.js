const itService = require('../services/it.services');

async function login(req,res){
    try{
        const result = await itService.login(req.body);
        res.json({result});
    }catch(err){
        res.json(err);
    }
}

async function register(req,res){
    try{
        const result = await itService.register(req.body);
        res.json(result);
    }catch(err){
        res.json(err.detail);
    }
}

async function showUser(req,res){
    try{
        const result = await itService.showUser(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function deleteUser(req,res){
    try{
        const result = await itService.deleteUser(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function addItem(req,res){
    try{
        const result = await itService.addItem(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function showItem(req,res){
    try{
        const result = await itService.showItem();
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function searchItemByName(req,res){
    try{
        const result = await itService.searchItemByName(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function updateItem(req,res){
    try{
        const result = await itService.updateItem(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function deleteItem(req,res){
    try{
        const result = await itService.deleteItem(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function addLocation(req,res){
    try{
        const result = await itService.addLocation(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function showLocation(req,res){
    try{
        const result = await itService.showLocation();
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function updateLocation(req,res){
    try{
        const result = await itService.updateLocation(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function moveItem(req,res){
    try{
        const result = await itService.moveItem(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function showMovement(req,res){
    try{
        const result = await itService.showMovement();
        res.json(result);
    }catch(err){
        res.json(err);
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