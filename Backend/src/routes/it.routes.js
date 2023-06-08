const passport = require('passport');
const express = require('express');
const router = express.Router();
const itController = require('../controllers/it.controllers');

//router.post('/login',passport.authenticate('local'), itController.login);

router.post('/login', itController.login);


router.post('/register', itController.register);

router.get('/showuser', itController.showUser);

router.delete('/deleteuser', itController.deleteUser);

router.post('/additem', itController.addItem);

router.get('/showitem', authenticateUser, itController.showItem);

router.get('/searchitembyname', itController.searchItemByName);

router.put('/updateitem', itController.updateItem);

router.delete('/deleteitem', itController.deleteItem);

router.post('/addlocation', itController.addLocation);

router.get('/showlocation', authenticateUser, itController.showLocation);

router.put('/updatelocation', itController.updateLocation);

router.post('/moveitem', itController.moveItem);

router.get('/showmovement', authenticateUser, itController.showMovement);

function authenticateUser(req, res, next) {
    // Check if the user is authenticated by checking if the session contains a user object
    if (req.session.user) {
      next();
    } else {
      res.status(401).json({ message: 'Unauthorized' });
    }
  }

module.exports = router;