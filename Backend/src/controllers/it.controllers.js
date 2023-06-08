const itService = require('../services/it.services');

async function login(req, res) {
    try {
      const result = await itService.login(req.body);
      if (result.message === 'Login successful') {
        req.session.user = result.user;
        res.status(200).json(result);
      } else {
        res.status(401).json(result);
      }
    } catch (err) {
      res.status(500).json({ message: 'Internal server error' });
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
    if(req.session.user){
        try{
            const result = await itService.showItem();
            res.json({user: req.session.user, message: result.message, showItems: result.showItems} );
        }catch(err){
            res.json(err);
        }
    }else{
        res.status(401).json({ message: 'User not logged in' });

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
    if(req.session.user){
        try{
            const result = await itService.showLocation();
            res.json({user: req.session.user, message: result.message, showLocation: result.showLocation} );
        }catch(err){
            res.json(err);
        }
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
    if(req.session.user){
        try{
            const result = await itService.showMovement();
            res.json({user: req.session.user, message: result.message, showMovement: result.showMovement} );
        }catch(err){
            res.json(err);
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