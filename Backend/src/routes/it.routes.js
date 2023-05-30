const passport = require('passport');
const express = require('express');
const router = express.Router();
const itController = require('../controllers/it.controllers');

router.post('/login',passport.authenticate('local'), itController.login);

router.post('/register', itController.register);

router.get('/showuser', itController.showUser);

router.delete('/deleteuser', itController.deleteUser);

router.post('/additem', itController.addItem);

router.get('/showItem', itController.showItem);

router.get('/searchitembyname', itController.searchItemByName);

router.put('/updateitem', itController.updateItem);

router.delete('/deleteitem', itController.deleteItem);

router.post('/addlocation', itController.addLocation);

router.get('/showlocation', itController.showLocation);

router.put('/updatelocation', itController.updateLocation);

router.post('/moveitem', itController.moveItem);

router.get('/showmovement', itController.showMovement);

module.exports = router;